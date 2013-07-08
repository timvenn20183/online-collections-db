class AddNoteToPlatform < ActiveRecord::Migration
  def change
    add_column :platforms, :note, :text
  end
end
