class Category < ActiveRecord::Base

    extend FriendlyId

    validates :name, :presence => true

    has_and_belongs_to_many :things
    belongs_to :site

    friendly_id :name, use: :slugged

    def can_be_removed
        self.things.count == 0 ? true : false
    end

end
