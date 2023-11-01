class MicropostsController < ApplicationController

  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def show
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to root_path, notice: '投稿しました'
    end
  end


  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
