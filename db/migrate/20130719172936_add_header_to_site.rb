class AddHeaderToSite < ActiveRecord::Migration
  def change
    add_column :sites, :header, :string
    add_column :sites, :tagline, :string
  end
end
