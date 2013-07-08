class CreateRolodexes < ActiveRecord::Migration
    def change
        create_table :rolodexes do |t|
            t.string :name
            t.integer :rolodex_type, :default => 0
            t.string :email
            t.string :cell
            t.string :tel
            t.string :password
            t.string :username
            t.timestamps
        end
    end
end
