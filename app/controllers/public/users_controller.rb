class Public::UsersController < ApplicationController

  def index
    @user = current_user
    @users = User.all
  end

  def show
    @login_user = current_user
    @user = User.find(params[:id])
  end
  
  def my_page
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw

  end

  def bookmarks
    @user = User.find(params[:id])
    @sign_in_user = current_user
  end
end
