class AddAquirefromToThings < ActiveRecord::Migration
  def change
    add_column :things, :aquired_from, :integer
  end
end
