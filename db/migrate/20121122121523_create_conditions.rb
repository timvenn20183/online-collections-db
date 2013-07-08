class CreateConditions < ActiveRecord::Migration
    def change
        create_table :conditions do |t|
            t.string :name
            t.string :cached_slug
            t.timestamps
        end
    end
end
