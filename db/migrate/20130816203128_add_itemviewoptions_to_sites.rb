class AddItemviewoptionsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :item_view_options, :text
  end
end
