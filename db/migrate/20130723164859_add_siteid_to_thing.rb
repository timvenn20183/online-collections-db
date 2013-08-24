class AddSiteidToThing < ActiveRecord::Migration
  def change
    add_column :things, :site_id, :integer
    add_index :things, :site_id
  end
end
