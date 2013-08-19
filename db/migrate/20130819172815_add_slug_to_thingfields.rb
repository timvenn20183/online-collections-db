class AddSlugToThingfields < ActiveRecord::Migration
  def change
    add_column :thingfields, :slug, :string
    remove_column :thingfields, :cached_slug
  end
end
