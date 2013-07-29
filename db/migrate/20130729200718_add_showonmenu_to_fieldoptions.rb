class AddShowonmenuToFieldoptions < ActiveRecord::Migration
  def change
    add_column :fieldoptions, :show_on_menu, :boolean, :default => false
  end
end
