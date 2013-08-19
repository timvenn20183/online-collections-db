class Category < ActiveRecord::Base

    extend FriendlyId

    validates :name, :presence => true

    attr_accessible :cached_slug, :name

    has_and_belongs_to_many :things

    friendly_id :name, use: :slugged

    def can_be_removed
        self.things.count == 0 ? true : false
    end

end
