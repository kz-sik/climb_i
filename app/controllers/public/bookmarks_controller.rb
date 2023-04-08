class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def create
    @item = Item.find(params[:item_id])
    bookmark = @item.bookmarks.new(user_id: current_user.id)
    bookmark.save
    redirect_to request.referer
  end

  def destroy
    @item = Item.find(params[:item_id])
    bookmark = @item.bookmarks.find_by(user_id: current_user.id)
    bookmark.destroy if bookmark.present?
    redirect_to request.referer
  end

end
