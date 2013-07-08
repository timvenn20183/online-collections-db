class AddMainimageToThing < ActiveRecord::Migration
  def change
    add_column :things, :mainimage, :string
  end
end
