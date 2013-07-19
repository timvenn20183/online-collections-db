class Dialog < ActiveRecord::Base

	attr_accessible :key, :node

    validates :content, :presence => true

end
