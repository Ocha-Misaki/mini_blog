class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show; end

  def edit; end

  def update
    if current_user.update(user_params)
      redirect_to user_profile_path, notice: '名前/プロフィールを更新しました'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile)
  end
end
