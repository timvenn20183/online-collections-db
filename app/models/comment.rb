class Comment < ActiveRecord::Base

    belongs_to :site

	validates :name, :presence => true
	validates :email_address, :presence => true
	validates :subject, :presence => true
	validates :detail, :presence => true

end
