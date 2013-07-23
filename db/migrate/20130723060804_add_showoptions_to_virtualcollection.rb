class AddShowoptionsToVirtualcollection < ActiveRecord::Migration
  def change
    add_column :virtualcollections, :show_on_menu, :boolean, :default => true
    add_column :virtualcollections, :public_visible, :boolean, :default => true
  end
end
