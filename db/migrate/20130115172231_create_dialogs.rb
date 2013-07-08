class CreateDialogs < ActiveRecord::Migration
    def change
        create_table :dialogs do |t|
            t.string :key
            t.text :comment
            t.timestamps
        end
    end
end
