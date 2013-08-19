class FieldoptionsThings < ActiveRecord::Migration
    def up
        create_table :fieldoptions_things, :primary_key => :alt_id do |t|
            t.integer :thing_id
            t.integer :fieldoption_id
            t.integer :thingfield_id
        end
    add_index :fieldoptions_things, :thing_id
    add_index :fieldoptions_things, :fieldoption_id
    add_index :fieldoptions_things, :thingfield_id
    end

    def down
        drop_table :fieldoptions_things
    end
end
