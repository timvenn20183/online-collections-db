class CreateWanteds < ActiveRecord::Migration
  def change
    create_table :wanteds do |t|
      t.string :name
      t.integer :site_id

      t.timestamps
    end
  end
end
