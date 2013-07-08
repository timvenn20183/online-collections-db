class CreateWebrings < ActiveRecord::Migration
    def change
        create_table :webrings do |t|
            t.string :name
            t.boolean :active, :default => true
            t.text :code
            t.timestamps
        end
    end
end
