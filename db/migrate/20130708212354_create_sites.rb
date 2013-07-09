class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :code
      t.string :title

      t.timestamps
    end
  end
end
