class AddNoteToThings < ActiveRecord::Migration
  def change
    add_column :things, :note, :text
  end
end
