class Feed < ActiveRecord::Base
  
  attr_accessible :content, :slug, :url
  
  after_initialize :update!
  
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
    if updated_at < 15.minutes.ago || content.blank?
      self.fetch!
    else
      return false
    end
  end
  
end
