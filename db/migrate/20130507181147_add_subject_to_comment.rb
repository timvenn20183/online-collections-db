class AddSubjectToComment < ActiveRecord::Migration
  def change
    add_column :comments, :subject, :string
  end
end
