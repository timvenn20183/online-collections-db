class AddPublicvisibleToPlatform < ActiveRecord::Migration
  def change
    add_column :platforms, :public_visible, :boolean, :default => true
  end
end
