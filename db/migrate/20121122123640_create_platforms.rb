class CreatePlatforms < ActiveRecord::Migration
    def change
        create_table :platforms do |t|
            t.string :name
            t.string :cached_slug
            t.timestamps
        end
    end
end
