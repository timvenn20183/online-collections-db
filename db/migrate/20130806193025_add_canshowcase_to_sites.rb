class AddCanshowcaseToSites < ActiveRecord::Migration
  def change
    add_column :sites, :can_showcase, :boolean, :default => false
  end
end
