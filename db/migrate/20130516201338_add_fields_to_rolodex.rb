class AddFieldsToRolodex < ActiveRecord::Migration
  def change
    add_column :rolodexes, :history, :text
    add_column :rolodexes, :start_date, :date
    add_column :rolodexes, :end_date, :date
  end
end
