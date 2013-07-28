class AddOptionsToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :show_on_menu, :boolean, :default => true
    add_column :conditions, :site_id, :integer
  end
end
