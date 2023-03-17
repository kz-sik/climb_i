class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @review = current_user.reviews.new(review_params)
    @review.item_id = @item.id
    review_count = Review.where(item_id: params[:item_id]).where(user_id: current_user.id).count
    if @review.valid?
      # バリデーションエラーが無い、且つレビューを一度もしたことない場合
      if review_count < 1
        @review.save
        redirect_to item_review_path(@item.id, @review.id), notice: "レビューの投稿に成功しました。"
      else
        redirect_to item_path(@item.id), notice: "レビューの投稿は一度までです"
      end
    else
      flash[:notice] = "レビューの投稿に失敗しました。内容を確認してください。"
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @item = Item.find(params[:item_id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "レビューの編集に成功しました。"
      redirect_to item_review_path(@review.item_id, @review.id)
    else
      flash[:notice] = "レビューの編集に失敗しました。内容を確認してください。"
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to item_path(@review.item_id)
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :item_id, :star, :comment)
  end
end
