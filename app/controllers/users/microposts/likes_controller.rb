class Users::Microposts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_micropost
  before_action :correct_micropost
  def create
    current_user.likes.create!(micropost_id: @micropost.id)
    redirect_to micropost_path(@micropost), notice: 'いいねしました'
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy!
    redirect_to micropost_path(@micropost), notice: 'いいね削除しました'
  end

  private
  def set_micropost
    @micropost = Micropost.find(params[:micropost_id])
  end

  def correct_micropost
    if @micropost.user == current_user
      redirect_to micropost_path(@micropost)
    end
  end
end
