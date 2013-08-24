class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email_address
      t.text :detail
      t.integer :thing_id
      t.boolean :approved
      t.string :name

      t.timestamps
    end
      add_index :comments, :thing_id
  end
end
