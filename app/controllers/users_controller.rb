class UsersController < ApplicationController
  before_action :user_signed_in?, only: %i[index show following followers]
  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.order(:id)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.order(:id)
    render 'show_follow'
  end
end
