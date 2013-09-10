class AddPasswordretryToSites < ActiveRecord::Migration
  def change
    add_column :sites, :password_retry, :integer, :default => 0
  end
end
