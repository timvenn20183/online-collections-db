class MediaThings < ActiveRecord::Migration
    def up
        create_table :media_things, :id => false do |t|
            t.integer :media_id
            t.integer :thing_id
            t.timestamp
        end
    add_index :media_things, :media_id
    add_index :media_things, :thing_id
    end

    def down
        drop_table :media_things
    end
end
