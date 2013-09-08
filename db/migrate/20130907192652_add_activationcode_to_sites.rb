class AddActivationcodeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :activation_code, :string
  end
end
