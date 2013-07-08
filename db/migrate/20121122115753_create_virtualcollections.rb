class CreateVirtualcollections < ActiveRecord::Migration
    def change
        create_table :virtualcollections do |t|
            t.string :name
            t.string :cached_slug
            t.timestamps
        end
    end
end
