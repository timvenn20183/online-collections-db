class Webring < ActiveRecord::Base

	has_many :virtualcollections
	has_many :platforms

    attr_accessible :active, :code, :name, :webring_id
    
end
