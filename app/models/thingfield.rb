class Thingfield < ActiveRecord::Base

    has_many :fieldoptions
    has_and_belongs_to_many :things, :join_table => 'fieldoptions_things'

    attr_accessible :etype, :name

end
