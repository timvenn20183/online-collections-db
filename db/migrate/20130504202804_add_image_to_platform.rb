class AddImageToPlatform < ActiveRecord::Migration
  def change
    add_column :platforms, :image, :string
  end
end
