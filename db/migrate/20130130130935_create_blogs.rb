class CreateBlogs < ActiveRecord::Migration
    def change
        create_table :blogs do |t|
            t.string :name
            t.text :content
            t.date :publish_date
            t.date :withdraw_date
            t.boolean :draft, :default => true
            t.boolean :front_page, :default => false
            t.integer :order, :default => 0
            t.string :cached_slug
            t.timestamps
        end
    end
end
