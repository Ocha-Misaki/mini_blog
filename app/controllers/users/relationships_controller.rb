class Users::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
  end

  def destroy
    user = current_user.active_relationships.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user, notice: 'フォロー解除しました', status: :see_other
  end
end
