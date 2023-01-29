class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.save
    redirect_to item_review_path(@review.item_id, @review.id)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :item_id, :star, :comment)
  end
end
