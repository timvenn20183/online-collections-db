class AddTemplateToThings < ActiveRecord::Migration
    def change
        add_column :things, :template, :string, :default => 'generic'
    end
end
