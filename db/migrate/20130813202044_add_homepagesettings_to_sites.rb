class AddHomepagesettingsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :homepage_options, :text
  end
end
