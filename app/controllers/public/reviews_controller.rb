class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
    @user = current_user
  end

  def create
    @item = Item.find(params[:item_id])
    @review = current_user.reviews.new(review_params)
    @review.item_id = @item.id
    @review.save
    redirect_to item_review_path(@item.id, @review.id)
  end

  def show
    @user = current_user
    @review = Review.find(params[:id])
    @item = Item.find(params[:item_id])
  end

  def edit
    @user = current_user
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to item_review_path(@review.item_id, @review.id)
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :item_id, :star, :comment)
  end
end
