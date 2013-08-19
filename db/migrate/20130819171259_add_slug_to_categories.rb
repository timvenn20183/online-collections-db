class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :slug, :string
    remove_column :categories, :cached_slug
  end
end
