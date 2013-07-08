class AddInsideToThing < ActiveRecord::Migration
  def change
    add_column :things, :inside_id, :integer
  end
end
