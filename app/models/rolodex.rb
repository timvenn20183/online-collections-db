class Rolodex < ActiveRecord::Base

    attr_accessible :cell, :email, :name, :password, :rolodex_type, :tel, :username

    has_and_belongs_to_many :things

    scope :historical, lambda {self.all(:conditions => ['rolodex_type = ?',ROLODEX_HISTORY])}
    scope :user, lambda {self.all(:conditions => ['rolodex_type = ?',ROLODEX_USER])}
    scope :company, lambda {self.all(:conditions => ['rolodex_type = ?',ROLODEX_COMPANY])}
    scope :contact, lambda {self.all(:conditions => ['rolodex_type = ?',ROLODEX_CONTACT])}

    def can_be_removed
        return false
    end

end
