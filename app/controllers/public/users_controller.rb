class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def my_page
    @followers = current_user.followers.order('id DESC').limit(4)
    @followings = current_user.followings.order('id DESC').limit(4)
    @reviews = Review.where(user_id: [*current_user.following_ids])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_my_page_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def bookmarks
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:image, :name, :sex, :height, :is_deleted, :email, :encrypted_password,)
  end
end
