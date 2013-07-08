class BlogsCategories < ActiveRecord::Migration
    def up
        create_table :blogs_categories, :id => false do |t|
            t.integer :blog_id
            t.integer :category_id
            t.timestamp
        end
    add_index :blogs_categories, :category_id
    add_index :blogs_categories, :blog_id
    end

    def down
        drop_table :blogs_categories
    end
end
