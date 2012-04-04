class CreateFeedCategories < ActiveRecord::Migration
  def change
    create_table :feed_categories do |t|
      t.string :slug
      t.string :name
      
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      
      t.timestamps
    end
  end
end
