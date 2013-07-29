class AddCachedslugToThingfields < ActiveRecord::Migration
  def change
    add_column :thingfields, :cached_slug, :string
  end
end
