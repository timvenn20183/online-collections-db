class AddTrackercodeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :tracker_code, :text
  end
end
