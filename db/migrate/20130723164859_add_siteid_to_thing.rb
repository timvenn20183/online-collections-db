class AddSiteidToThing < ActiveRecord::Migration
  def change
    add_column :things, :site_id, :integer
  end
end
