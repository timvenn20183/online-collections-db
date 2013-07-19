class CreateDialogs < ActiveRecord::Migration
  def change
    create_table :dialogs do |t|
      t.integer :user_id
      t.string :code
      t.text :content

      t.timestamps
    end
  end
end
