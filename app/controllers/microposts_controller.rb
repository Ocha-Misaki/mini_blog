class MicropostsController < ApplicationController
  before_action :get_micropost, only:[:show,:edit,:update,:destroy]

  def index
    @microposts = Micropost.order(id: :asc)
  end

  def new
    @micropost = Micropost.new
  end

  def show

  end

  def edit
  end

  def update
    if @micropost.update(micropost_params)
      redirect_to root_path, notice: '変更しました'
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
    @micropost.destroy
    redirect_to root_path, notice: '削除しました'
  end


private

  def get_micropost
    @micropost = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
