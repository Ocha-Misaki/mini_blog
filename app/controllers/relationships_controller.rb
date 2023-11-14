class RelationshipsController < ApplicationController

  def create
    if user_signed_in?
      user = User.find(params[:followed_id])
      current_user.follow(user)
      redirect_to user
    end
  end

  def destroy
    if user_signed_in?
      user = current_user.active_relationships.find(params[:id]).followed
      current_user.unfollow(user)
      redirect_to user, notice: 'フォロー解除しました'
    end
  end
end
