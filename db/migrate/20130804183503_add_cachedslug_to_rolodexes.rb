class AddCachedslugToRolodexes < ActiveRecord::Migration
  def change
    add_column :rolodexes, :cached_slug, :string
  end
end
