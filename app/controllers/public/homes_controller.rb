class Public::HomesController < ApplicationController
  def top
    @users = User.order('id DESC').limit(4)
    @items = Item.order('id DESC').limit(4)
    @reviews = Review.order('id DESC').limit(4)
  end

  def about
  end
end
