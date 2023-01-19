class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
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
