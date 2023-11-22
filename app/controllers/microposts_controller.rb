class MicropostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @micropost = Micropost.find(params[:id])
    @like = Like.find_by(micropost_id: @micropost.id)
  end
end
