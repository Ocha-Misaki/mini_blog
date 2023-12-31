class Users::MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_micropost, only: %i[show edit update destroy]

  def index
    @feed_items = current_user.feed.order(created_at: :desc).paginate(page: params[:page])
  end

  def new
    @micropost = current_user.microposts.new
  end

  def show
    @like = current_user.likes.find_by(micropost_id: @micropost.id)
  end

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
    redirect_to root_path, notice: '削除しました', status: :see_other
  end

  private

  def set_micropost
    @micropost = current_user.microposts.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
