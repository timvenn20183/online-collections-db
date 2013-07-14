class Comment < ActiveRecord::Base

	validates :name, :presence => true
	validates :email_address, :presence => true
	validates :subject, :presence => true
	validates :detail, :presence => true

	attr_accessible :approved, :detail, :email_address, :gallery_id, :name, :thing_id, :subject

end
