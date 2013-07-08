class AddAquiredateToThings < ActiveRecord::Migration
  def change
    add_column :things, :aquire_date, :date
  end
end
