class AddShowonmenuToRolodexes < ActiveRecord::Migration
  def change
    add_column :rolodexes, :show_on_menu, :boolean, :default => false
    add_column :rolodexes, :site_id, :integer
    add_index :rolodexes, :site_id
  end
end
