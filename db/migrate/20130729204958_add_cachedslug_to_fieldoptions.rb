class AddCachedslugToFieldoptions < ActiveRecord::Migration
  def change
    add_column :fieldoptions, :cached_slug, :string
  end
end
