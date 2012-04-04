class FeedCategory < ActiveRecord::Base
  
  acts_as_nested_set
  
  def feeds
    Feed.where(:category_id => self.self_and_descendants.map(&:id))
  end
  
  attr_protected :rgt, :left
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
end
