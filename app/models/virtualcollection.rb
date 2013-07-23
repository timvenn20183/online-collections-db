class Virtualcollection < ActiveRecord::Base

    validates :name, :presence => true

    attr_accessible :cached_slug, :name, :note

    has_friendly_id :name, use_slug: true

    belongs_to :site

    has_and_belongs_to_many :things

    scope :menu, lambda {self.all(:conditions => ['show_on_menu = ?',true])}
    scope :public, lambda {self.all(:conditions => ['public_visible = ?',true])}
    scope :publicmenu, lambda {self.all(:conditions => ['public_visible = ? and show_on_menu = ?',true,true])}

    def can_be_removed
        self.things.count == 0 ? true : false
    end

end
