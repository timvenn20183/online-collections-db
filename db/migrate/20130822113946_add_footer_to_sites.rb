class AddFooterToSites < ActiveRecord::Migration
  def change
    add_column :sites, :footer, :text
  end
end
