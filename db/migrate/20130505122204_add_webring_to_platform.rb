class AddWebringToPlatform < ActiveRecord::Migration
  def change
    add_column :platforms, :webring_id, :integer
  end
end
