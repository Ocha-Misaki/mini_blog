class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @current_user = current_user
    @user = User.find(params[:id])
  end
end
