class Condition < ActiveRecord::Base

    extend FriendlyId

    validates :name, :presence => true

    attr_accessible :cached_slug, :name

    friendly_id :name, use: :slugged

    has_and_belongs_to_many :things
    belongs_to :site

    scope :menu, lambda {self.all(:conditions => ['show_on_menu = ?',true])}

    def can_be_removed
        self.things.count == 0 ? true : false
    end

end
