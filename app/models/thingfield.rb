class Thingfield < ActiveRecord::Base

    extend FriendlyId

    has_many :fieldoptions
    belongs_to :site
    has_and_belongs_to_many :things, :join_table => 'fieldoptions_things'

    friendly_id :name, use: :slugged

end
