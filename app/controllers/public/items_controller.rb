class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
    @genres = Genre.all
    @makers = Maker.all
  end

  def create
    @item = Item.new(item_params)
    @review = Review.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :maker_id, :name, :introduction, :image)
  end
end
