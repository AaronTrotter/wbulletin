class FeedsController < ApplicationController
  
  def show
    @feed = Feed.find_by_slug(params[:id])
  end
  
end