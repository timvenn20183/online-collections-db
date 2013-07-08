class AddMd5ToGallery < ActiveRecord::Migration
  def change
    add_column :galleries, :md5, :string
  end
end
