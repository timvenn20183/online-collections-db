class AddShowonmenuToThingfields < ActiveRecord::Migration
  def change
    add_column :thingfields, :show_on_menu, :boolean, :default => true
  end
end
