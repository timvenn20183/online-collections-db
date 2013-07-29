class AddSiteidToFieldoptions < ActiveRecord::Migration
  def change
    add_column :fieldoptions, :site_id, :integer
  end
end
