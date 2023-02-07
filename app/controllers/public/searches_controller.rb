class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @user = current_user
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:word])
    else
      @items = Item.looks(params[:word])
    end
    render "/public/searches/search_result"

  end
end
