class AddProvinceToRolodex < ActiveRecord::Migration
  def change
    add_column :rolodexes, :province, :string
  end
end
