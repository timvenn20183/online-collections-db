class AddLastitemeditlistToSite < ActiveRecord::Migration
  def change
    add_column :sites, :last_item_edit_list, :string
  end
end
