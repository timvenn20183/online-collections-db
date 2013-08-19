class AddSlugToRolodexes < ActiveRecord::Migration
  def change
    add_column :rolodexes, :slug, :string
    remove_column :rolodexes, :cached_slug
  end
end
