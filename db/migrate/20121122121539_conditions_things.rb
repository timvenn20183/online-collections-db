class ConditionsThings < ActiveRecord::Migration
    def up
        create_table :conditions_things, :id => false do |t|
            t.integer :condition_id
            t.integer :thing_id
            t.timestamp
        end
	add_index :conditions_things, :condition_id
	add_index :conditions_things, :thing_id
    end

    def down
        drop_table :conditions_things
    end

end
