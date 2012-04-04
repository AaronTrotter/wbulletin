SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.dom_class = 'nav'
    primary.item 'menu-home',  'Home',  root_url
    primary.item 'menu-feeds', 'Feeds', '#menu-feeds', :class => 'dropdown', :link => { :class => 'dropdown-toggle', 'data-toggle' => 'dropdown' } do |feeds|
      feeds.dom_class = 'dropdown-menu'
      Feed.all.each do |feed|
        feeds.item "menu-feeds-#{feed.slug}", "#{truncate(feed.title, :length => 30)}", feed_path(feed)
      end
    end
  end

end
