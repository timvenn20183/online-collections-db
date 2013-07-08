class CategoriesThings < ActiveRecord::Migration
    def up
        create_table :categories_things, :id => false do |t|
            t.integer :category_id
            t.integer :thing_id
            t.timestamp
        end
	add_index :categories_things, :category_id
	add_index :categories_things, :thing_id
    end

    def down
        drop_table :categories_things
    end
end
