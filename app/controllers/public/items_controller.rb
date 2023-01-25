class Public::ItemsController < ApplicationController
  def new
    @user = current_user
    @item = Item.new
    #itemと同時にtagとreviewも保存
      @item.tags.build
      @item.reviews.build
    @genres = Genre.all
    @makers = Maker.all
  end

  def create
    @item = Item.new(item_params)
    tag_list = params[:item][:name].split(',')
    if @item.save
      @item.save_tag(tag_list)
      redirect_to item_path(@item)
    else
      @genres = Genre.all
      @makers = Maker.all
      render :new
    end
  end

  def index
    @user = current_user
    @items = Item.all
  end

  def show
    @user = current_user
    @item = Item.find(params[:id])
  end

  def edit
    @user = current_user
    @item = Item.find(params[:id])
    @genres = Genre.all
    @makers = Maker.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :maker_id, :name, :introduction, :image, tags_attributes:[:id, :name], reviews_attributes:[:id, :user_id, :item_id, :star, :comment])
  end
end
