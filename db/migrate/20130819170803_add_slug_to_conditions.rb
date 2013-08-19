class AddSlugToConditions < ActiveRecord::Migration
  def change
    add_column :conditions, :slug, :string
    remove_column :conditions, :cached_slug
  end
end
