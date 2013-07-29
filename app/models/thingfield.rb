class Thingfield < ActiveRecord::Base

    has_many :fieldoptions
    belongs_to :site
    has_and_belongs_to_many :things, :join_table => 'fieldoptions_things'

    has_friendly_id :name, use_slug: true

    attr_accessible :etype, :name, :cached_slug

end
