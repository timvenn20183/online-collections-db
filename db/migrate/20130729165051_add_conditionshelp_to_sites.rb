class AddConditionshelpToSites < ActiveRecord::Migration
  def change
    add_column :sites, :conditions_help, :boolean, :default => true
  end
end
