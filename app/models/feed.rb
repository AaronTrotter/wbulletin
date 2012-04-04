class Feed < ActiveRecord::Base
  
  attr_accessible :url, :category
  
  belongs_to :category, class_name: 'FeedCategory'
  
  after_initialize :update!
  after_create     :update!
  
  extend FriendlyId
  friendly_id :title, :use => :slugged
  
  def parsed
    @parsed ||= Feedzirra::Feed.parse(self.content)
  end
  
  delegate :entries, :title, :to => :parsed
  
  def self.update_all!
    all.each(&:update!)
  end
  
  def fetch!
    self.content = Feedzirra::Feed.fetch_raw(self.url)
    logger.info "Feed '#{self.slug}' updated"
    self.save
  end
  
  def update!
    if content.blank? || self.updated_at < 15.minutes.ago
      self.fetch!
    else
      return false
    end
  end
  
end
