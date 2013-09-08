class AddCommsoptionsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :comms_options, :string
  end
end
