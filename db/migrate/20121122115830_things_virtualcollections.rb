class ThingsVirtualcollections < ActiveRecord::Migration
    def up
        create_table :things_virtualcollections, :id => false do |t|
            t.integer :thing_id
            t.integer :virtualcollection_id
            t.timestamp
        end
	add_index :things_virtualcollections, :thing_id
	add_index :things_virtualcollections, :virtualcollection_id
	
    end

    def down
        drop_table :things_virtualcollections
    end
end
