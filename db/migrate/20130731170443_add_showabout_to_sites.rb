class AddShowaboutToSites < ActiveRecord::Migration
  def change
    add_column :sites, :show_about, :boolean, :default => true
  end
end
