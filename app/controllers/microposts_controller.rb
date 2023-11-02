class MicropostsController < ApplicationController

  def index
    @microposts = Micropost.all
  end

  def new
    @micropost = Micropost.new
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update(micropost_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def create
    @micropost = Micropost.new(micropost_params)
    if @micropost.save
      redirect_to root_path, notice: '投稿しました'
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to root_path
  end

private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
