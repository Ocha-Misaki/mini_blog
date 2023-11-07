class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]

  def index
    @microposts = Micropost.order(updated_at: :desc)
  end

  def new
    @micropost = Micropost.new
  end

  def show; end

  def edit; end

  def update
    if @micropost.update(micropost_params)
      redirect_to root_path, notice: '変更しました'
    else
      render :edit
    end
  end

  def create
    @current_user = current_user
    @micropost = @current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to root_path, notice: '投稿しました'
    else
      render :new
    end
  end

  def destroy
    @micropost.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private

  def set_micropost
    @micropost = Micropost.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
