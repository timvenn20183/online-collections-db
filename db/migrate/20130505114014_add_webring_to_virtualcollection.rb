class AddWebringToVirtualcollection < ActiveRecord::Migration
  def change
    add_column :virtualcollections, :webring_id, :string
  end
end
