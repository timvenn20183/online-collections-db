class AddContactformToSites < ActiveRecord::Migration
  def change
    add_column :sites, :contact_form, :text
  end
end
