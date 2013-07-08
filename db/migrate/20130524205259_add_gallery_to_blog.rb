class AddGalleryToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :gallery_id, :integer
  end
end
