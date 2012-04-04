SimpleNavigation::Configuration.run do |navigation|
  
  navigation.items do |navigation|
    navigation.dom_class = 'nav nav-list'
    
    FeedCategory.roots.each do |category|
      navigation.item "menu-feed-category-#{category.to_param}", category.name, '', :class => 'nav-header' do |submenu|
        category.children.each do |subcategory|
          submenu.item "menu-feed-category-#{category.to_param}-#{subcategory.to_param}", subcategory.name, ''
        end
      end
    end
  end
  
end