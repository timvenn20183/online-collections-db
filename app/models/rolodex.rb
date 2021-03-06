class Rolodex < ActiveRecord::Base

    extend FriendlyId

    has_and_belongs_to_many :things
    belongs_to :site

    friendly_id :name, use: :slugged

    #scope :user, lambda {self.all(:conditions => ['rolodex_type = ?',ROLODEX_USER])}
    #scope :company, lambda {self.all(:conditions => ['rolodex_type = ?',ROLODEX_COMPANY])}
    #scope :contact, lambda {self.all(:conditions => ['rolodex_type = ?',ROLODEX_CONTACT])}
    scope :menu, lambda {self.all(:conditions => ['show_on_menu = ?',true])}

    def can_be_removed
        return false
    end

end
