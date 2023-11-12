class MicropostsController < ApplicationController
  before_action :set_micropost, only: %i[show edit update destroy]
  before_action :user_signed_in?, only: %i[index new show edit update create destroy]

  def index
    @feed_items = current_user.feed.paginate(page: params[:page])
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
    @micropost = current_user.microposts.build(micropost_params)
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
