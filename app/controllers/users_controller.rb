class UsersController < ApplicationController
  before_action :user_signed_in?, only: %i[index show]
  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
  end
end
