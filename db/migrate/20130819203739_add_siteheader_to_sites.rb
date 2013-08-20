class AddSiteheaderToSites < ActiveRecord::Migration
  def change
    add_column :sites, :siteheader, :string
  end
end
