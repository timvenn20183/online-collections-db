class AddMetaToSite < ActiveRecord::Migration
  def change
    add_column :sites, :meta_keywords, :text
    add_column :sites, :meta_description, :text
    add_column :sites, :owner, :string
    add_column :sites, :email, :string
    add_column :sites, :username, :string
    add_column :sites, :password, :string
  end
end
