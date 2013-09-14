class AddViewdateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :viewdate, :datetime
  end
end
