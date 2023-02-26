class Public::GenresController < ApplicationController
  before_action :authenticate_user!

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルの追加に成功しました。"
      redirect_to genres_path
    else
      @genres = Genre.all
      flash[:notice] = "ジャンルの追加に失敗しました。内容を確認してください。"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "ジャンルの編集に成功しました。"
      redirect_to genres_path
    else
      flash[:notice] = "ジャンルの編集に失敗しました。内容を確認してください。"
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
