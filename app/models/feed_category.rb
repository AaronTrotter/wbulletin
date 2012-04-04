class FeedCategory < ActiveRecord::Base
  
  acts_as_nested_set
  
  has_many :feeds
  
  attr_protected :rgt, :left
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
end
