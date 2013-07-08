class ArticlesThings < ActiveRecord::Migration
    def up
        create_table :articles_things, :id => false do |t|
            t.integer :article_id
            t.integer :thing_id
            t.timestamp
        end
	add_index :articles_things, :article_id
	add_index :articles_things, :thing_id
    end

    def down
        drop_table :articles_things
    end
end
