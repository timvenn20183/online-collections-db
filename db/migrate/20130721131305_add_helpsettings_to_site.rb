class AddHelpsettingsToSite < ActiveRecord::Migration
  def change
    add_column :sites, :items_help, :boolean, :default => true
    add_column :sites, :collections_help, :boolean, :default => true
    add_column :sites, :tags_help, :boolean, :default => true
  end
end
