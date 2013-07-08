class AddMenunameToPlatforms < ActiveRecord::Migration
  def change
    add_column :platforms, :menuname, :string
  end
end
