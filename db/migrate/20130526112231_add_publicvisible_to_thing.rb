class AddPublicvisibleToThing < ActiveRecord::Migration
  def change
    add_column :things, :public_visible, :boolean, :default => true
  end
end
