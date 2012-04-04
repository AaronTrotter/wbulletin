class FeedsController < ApplicationController
  
  def index
    @feeds = Feed.all
  end
  
  def show
    @feed = Feed.find_by_slug(params[:id])
  end
  
end