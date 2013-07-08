class PlatformsThings < ActiveRecord::Migration
    def up
        create_table :platforms_things, :id => false do |t|
            t.integer :platform_id
            t.integer :thing_id
            t.timestamp
        end
	add_index :platforms_things, :platform_id
	add_index :platforms_things, :thing_id
    end

    def down
        drop_table :platforms_things
    end
end
