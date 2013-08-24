class AddSiteidToFieldoptions < ActiveRecord::Migration
  def change
    add_column :fieldoptions, :site_id, :integer
    add_index :fieldoptions, :site_id
  end
end
