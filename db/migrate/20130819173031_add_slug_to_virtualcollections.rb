class AddSlugToVirtualcollections < ActiveRecord::Migration
  def change
    add_column :virtualcollections, :slug, :string
    remove_column :virtualcollections, :cached_slug
  end
end
