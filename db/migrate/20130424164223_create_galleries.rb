class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.integer :views
      t.string :cached_slug
      t.text :caption
      t.string :image
      t.timestamps
    end
  end
end
