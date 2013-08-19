class AddSlugToFieldoptions < ActiveRecord::Migration
  def change
    add_column :fieldoptions, :slug, :string
    remove_column :fieldoptions, :cached_slug
  end
end
