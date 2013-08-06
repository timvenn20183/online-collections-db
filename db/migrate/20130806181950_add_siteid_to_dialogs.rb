class AddSiteidToDialogs < ActiveRecord::Migration
  def change
    add_column :dialogs, :site_id, :integer
  end
end
