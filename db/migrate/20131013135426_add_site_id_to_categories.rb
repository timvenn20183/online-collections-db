class AddSiteIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :site_id, :integer
  end
end
