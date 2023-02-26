class Public::MakersController < ApplicationController
  before_action :authenticate_user!

  def index
    @maker = Maker.new
    @makers = Maker.all
  end

  def create
    @maker = Maker.new(maker_params)
    if @maker.save
      flash[:notice] = "メーカー名の追加に成功しました。"
      redirect_to makers_path
    else
      @makers = Maker.all
      flash[:notice] = "メーカー名の追加に失敗しました。内容を確認してください。"
      render :index
    end
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])
    if @maker.update(maker_params)
      flash[:notice] = "メーカー名の編集に成功しました。"
      redirect_to makers_path
    else
      flash[:notice] = "メーカー名の編集に失敗しました。内容を確認してください。"
      render :edit
    end
  end

  private

  def maker_params
    params.require(:maker).permit(:name)
  end
end
