class AddViewsToThing < ActiveRecord::Migration
  def change
    add_column :things, :views, :integer
  end
end
