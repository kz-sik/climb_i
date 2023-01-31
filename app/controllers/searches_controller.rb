class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @search = Search.new(search_params)
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:word])
      render "/searches/search_result"
    elsif @range == "Item"
      @items = Item.looks(params[:word])
      render "/searches/search_result"
    elsif @range == "Tag"
      @tags = Tag.looks(params[:word])
      render "/searches/search_result"
    end

  end

  private

  def search_params
    params.require(@search).permit(:range, :word)
  end
end
