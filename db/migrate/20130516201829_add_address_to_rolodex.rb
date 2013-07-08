class AddAddressToRolodex < ActiveRecord::Migration
  def change
    add_column :rolodexes, :address, :text
  end
end
