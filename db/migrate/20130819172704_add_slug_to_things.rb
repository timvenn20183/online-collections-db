class AddSlugToThings < ActiveRecord::Migration
  def change
    add_column :things, :slug, :string
    remove_column :things, :cached_slug
  end
end
