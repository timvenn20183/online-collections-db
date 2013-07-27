class CreateThings < ActiveRecord::Migration
    def change
        create_table :things do |t|
            t.string :name
            t.string :collection_id
            t.integer :visability, :default => 0
            t.boolean :active, :default => true
            t.integer :year, :default => 1981
            t.float :value, :default => 0.00
            t.float :cost, :default => 0.00
            t.string :cached_slug
            t.string :alphabet_letter
            t.date :release_date
            t.string :reference_number
            t.timestamps
        end
    end
end
