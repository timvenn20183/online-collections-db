class Category < ActiveRecord::Base

    has_and_belongs_to_many :blogs

    validates :name, :presence => true

    attr_accessible :cached_slug, :name

    has_and_belongs_to_many :things

    has_friendly_id :name, use_slug: true

    def can_be_removed
        self.things.count == 0 ? true : false
    end

end
