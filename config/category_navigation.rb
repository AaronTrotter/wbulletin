SimpleNavigation::Configuration.run do |navigation|
  
  navigation.items do |navigation|
    navigation.dom_class = 'nav nav-list'
    
    FeedCategory.roots.each do |category|
      navigation.item "menu-feed-category-#{category.to_param}", category.name, nil, :class => 'nav-header'
      category.children.each do |subcategory|
        navigation.item "menu-feed-category-#{category.to_param}-#{subcategory.to_param}", subcategory.name, category_path(subcategory)
      end
    end
  end
  
end