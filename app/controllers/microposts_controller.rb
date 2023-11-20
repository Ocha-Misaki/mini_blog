class MicropostsController < ApplicationController
  before_action :authenticate_user!
  def show
    @micropost = Micropost.find(params[:id])
  end
end
