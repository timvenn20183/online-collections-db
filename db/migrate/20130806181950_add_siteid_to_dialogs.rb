class AddSiteidToDialogs < ActiveRecord::Migration
  def change
    add_column :dialogs, :site_id, :integer
    add_index :dialogs, :site_id
  end
end
