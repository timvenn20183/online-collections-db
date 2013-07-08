class AddNoteToVirtualcollection < ActiveRecord::Migration
  def change
    add_column :virtualcollections, :note, :text
  end
end
