class AddSiteidToThingfields < ActiveRecord::Migration
  def change
    add_column :thingfields, :site_id, :integer
  end
end
