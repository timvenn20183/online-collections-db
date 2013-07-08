class AddViewsToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :views, :integer
    add_column :blogs, :last_edited_date, :datetime
  end
end
