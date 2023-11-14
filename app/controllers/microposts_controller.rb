class MicropostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @feed_items = current_user.feed.paginate(page: params[:page])
  end
end
