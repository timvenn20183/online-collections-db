class AddNavmenuToSites < ActiveRecord::Migration
  def change
    add_column :sites, :nav_menu, :boolean, :default => true
  end
end
