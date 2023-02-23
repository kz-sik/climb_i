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
    if @review.save
      redirect_to item_review_path(@item.id, @review.id)
    else
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
      redirect_to item_review_path(@review.item_id, @review.id)
    else
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
