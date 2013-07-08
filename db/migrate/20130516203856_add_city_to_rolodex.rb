class AddCityToRolodex < ActiveRecord::Migration
  def change
    add_column :rolodexes, :city, :string
  end
end
