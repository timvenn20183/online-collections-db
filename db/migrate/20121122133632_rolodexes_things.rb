class RolodexesThings < ActiveRecord::Migration
    def up
        create_table :rolodexes_things, :id => false do |t|
            t.integer :rolodex_id
            t.integer :thing_id
            t.timestamp
        end
	add_index :rolodexes_things, :thing_id
	add_index :rolodexes_things, :rolodex_id
    end

    def down
        drop_table :rolodexes_things
    end
end
