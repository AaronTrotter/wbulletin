module FeedHelper
  
  def feed_entry_summary(entry)
    Sanitize.clean(entry.summary.summarize(:ratio => 10), :elements => ['a', 'p', 'span', 'div', 'strong', 'h3'], :remove_contents => true).html_safe
  end
  
end