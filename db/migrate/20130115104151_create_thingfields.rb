class CreateThingfields < ActiveRecord::Migration
  def change
    create_table :thingfields do |t|
      t.string :name
      t.integer :etype

      t.timestamps
    end
  end
end
