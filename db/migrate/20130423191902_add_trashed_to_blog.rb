class AddTrashedToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :trashed, :boolean
  end
end
