class CreateFieldoptions < ActiveRecord::Migration
  def change
    create_table :fieldoptions do |t|
      t.string :name
      t.integer :thingfield_id
      t.timestamps
    end
    add_index :fieldoptions, :thingfield_id
  end
end
