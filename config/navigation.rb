SimpleNavigation::Configuration.run do |navigation|

  navigation.selected_class = 'active'

  navigation.items do |primary|
    primary.dom_class = 'nav'
    primary.item 'menu-home', 'Home',  root_url
    
    primary.item 'menu-categories', 'Categories', '#', :class => 'dropdown', :link => { :class => 'dropdown-toggle', 'data-toggle' => 'dropdown' } do |categories|
      categories.dom_class = 'dropdown-menu'
      
      categories.item 'menu-feed-category-all', 'All Categories', nil, :class => 'nav-header'
      
      FeedCategory.roots.each do |category|
        categories.item nil, nil, nil, :class => 'divider'
        categories.item "menu-feed-category-#{category.to_param}", category.name, nil, :class => 'nav-header'
        category.children.each do |subcategory|
          categories.item "menu-feed-category-#{category.to_param}-#{subcategory.to_param}", subcategory.name, category_path(subcategory)
        end
      end
    end
    
    primary.item 'menu-feeds', 'Feeds', '#', :class => 'dropdown', :link => { :class => 'dropdown-toggle', 'data-toggle' => 'dropdown' } do |feeds|
      feeds.dom_class = 'dropdown-menu'
      Feed.all.each do |feed|
        feeds.item "menu-feeds-#{feed.slug}", "#{truncate(feed.title, :length => 30)}", feed_path(feed)
      end
    end
  end

end
