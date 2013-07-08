class AddSearchstringToThings < ActiveRecord::Migration
  def change
    add_column :things, :searchstring, :string
  end
end
