class AddActivationDateToSites < ActiveRecord::Migration
  def change
    add_column :sites, :activation_date, :datetime
  end
end
