class Public::ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      flash[:notice] = "アイテムの投稿が成功しました。"
      redirect_to item_path(@item)
    else
      @user = current_user
      @genres = Genre.all
      @makers = Maker.all
      flash[:notice] = "アイテムの投稿に失敗しました。投稿内容を確認してください。"
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
    @item = Item.find(params[:id])
      @item.tags.build
    @genres = Genre.all
    @makers = Maker.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "アイテムの更新に成功しました。"
      redirect_to item_path(@item)
    else
      @genres = Genre.all
      @makers = Maker.all
      flash[:notice] = "アイテムの更新に失敗しました。投稿内容を確認してください。"
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:genre_id, :maker_id, :name, :introduction, :image, :tag_names, tag_ids: [], reviews_attributes:[:id, :user_id, :item_id, :star, :comment])
  end
end
