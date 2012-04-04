class FeedCategoriesController < ApplicationController
  
  def show
    @category = FeedCategory.find(params[:id])
  end
  
end