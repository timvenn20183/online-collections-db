class AddMenuoptionsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :menu_options, :text
  end
end
