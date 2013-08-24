class AddSiteidToThingfields < ActiveRecord::Migration
  def change
    add_column :thingfields, :site_id, :integer
    add_index :thingfields, :site_id
  end
end
