class Admin::ReviewsController < ApplicationController
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_item_path(params[:item_id])
  end
end
