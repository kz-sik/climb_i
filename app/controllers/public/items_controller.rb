class Public::ItemsController < ApplicationController
  def new
    @item = Item.new
    #itemと同時にtagとreviewも保存
      @item.tags.build
      @item.reviews.build
    @genres = Genre.all
    @makers = Maker.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      @user = current_user
      @genres = Genre.all
      @makers = Maker.all
      render :new
    end
  end

  def index
    @items = params[:tag_id].present? ? Tag.find(params[:tag_id]).items : Item.all
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
    params.require(:item).permit(:genre_id, :maker_id, :name, :introduction, :image, :tag_names, tag_ids: [], reviews_attributes:[:id, :user_id, :item_id, :star, :comment])
  end
end
