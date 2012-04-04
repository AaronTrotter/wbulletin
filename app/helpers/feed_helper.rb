module FeedHelper
  
  def feed_clean(content)
    Sanitize.clean(content, :elements => ['a', 'p', 'span', 'div', 'strong', 'h3'], :attributes => { 'a' => ['href'] }, :remove_contents => true).html_safe
  end
  
  def feed_entry_summary(entry)
    feed_clean(entry.summary).summarize(:ratio => 10).force_encoding('UTF-8')
  end
  
end