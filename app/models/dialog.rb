class Dialog < ActiveRecord::Base

	attr_accessible :key, :node

    belongs_to :site

    validates :content, :presence => true

end
