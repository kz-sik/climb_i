class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create
    @item = Item.find(params[:item_id])
    bookmark = @item.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    bookmark = @item.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
      bookmark.destroy
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end
end
