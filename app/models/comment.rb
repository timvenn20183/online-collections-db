class Comment < ActiveRecord::Base

	validates :name, :presence => true
	validates :email_address, :presence => true
	validates :subject, :presence => true
	validates :detail, :presence => true

end
