class Fieldoption < ActiveRecord::Base

    belongs_to :thingfield
    belongs_to :site
    has_and_belongs_to_many :things, :join_table => 'fieldoptions_things'

    attr_accessible :i, :s, :thingfield_id, :show_on_menu

    has_friendly_id :name, use_slug: true

    scope :menu, lambda {self.all(:conditions => ['show_on_menu = ?',true])}

    def can_be_removed
        self.things.count == 0 ? true : false
    end

end
