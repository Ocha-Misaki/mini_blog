class Microposts::LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    ##　投稿詳細ページを作成する
    @micropost = Micropost.find(params[:id])
    if @micropost.user != current_user
      @likes = Like.build(user_id: current_user.id,
                          micropost_id: @micropost.id)
      redirect_to user_path(@micropost.user), notice: 'いいねしました'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @likes = Like.find_by(user_id: current_user.id,
                          micropost_id: @micropost.id)
    @likes.destroy!
    redirect_to user_path(@micropost.user), notice: 'いいね削除しました'
  end
end
