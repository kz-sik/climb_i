class Public::MakersController < ApplicationController
  def index
    @maker = Maker.new
    @makers = Maker.all
  end

  def create
    @maker = Maker.new(maker_params)
    @maker.save
    redirect_to makers_path
  end

  def edit
    @maker = Maker.find(params[:id])
  end

  def update
    @maker = Maker.find(params[:id])
    @maker.update(maker_params)
    redirect_to makers_path
  end

  private

  def maker_params
    params.require(:maker).permit(:name)
  end
end
