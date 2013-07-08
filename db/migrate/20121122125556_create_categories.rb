class CreateCategories < ActiveRecord::Migration
    def change
        create_table :categories do |t|
            t.string :name
            t.string :cached_slug
            t.timestamps
        end
    end
end
