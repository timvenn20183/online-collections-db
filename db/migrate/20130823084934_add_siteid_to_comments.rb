class AddSiteidToComments < ActiveRecord::Migration
  def change
    add_column :comments, :site_id, :integer
    add_index :comments, :site_id
  end
end
