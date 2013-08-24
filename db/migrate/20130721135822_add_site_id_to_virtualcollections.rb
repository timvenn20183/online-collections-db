class AddSiteIdToVirtualcollections < ActiveRecord::Migration
  def change
    add_column :virtualcollections, :site_id, :integer
    add_index :virtualcollections, :site_id
  end
end
