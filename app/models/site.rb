class Site < ActiveRecord::Base

    has_many :virtualcollections

    attr_accessible :code, :title, :meta_keywords, :meta_description, :email, :owner, :username, :password, :header, :tagline

    validates :header, :presence => true

end
