class AddFieldshelpToSites < ActiveRecord::Migration
  def change
    add_column :sites, :fields_help, :boolean, :default => true
  end
end
