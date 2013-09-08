class AddSenddateToComments < ActiveRecord::Migration
  def change
    add_column :comments, :send_date, :datetime
  end
end
