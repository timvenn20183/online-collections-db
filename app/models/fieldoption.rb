class Fieldoption < ActiveRecord::Base

    belongs_to :thingfield
    has_and_belongs_to_many :things, :join_table => 'fieldoptions_things'

    attr_accessible :i, :s, :thingfield_id

    def can_be_removed
        self.things.count == 0 ? true : false
    end

end
