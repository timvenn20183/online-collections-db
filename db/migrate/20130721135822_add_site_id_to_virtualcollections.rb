class AddSiteIdToVirtualcollections < ActiveRecord::Migration
  def change
    add_column :virtualcollections, :site_id, :integer
  end
end
