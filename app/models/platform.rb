class Platform < ActiveRecord::Base

    validates :name, :presence => true

    attr_accessible :cached_slug, :name, :menuname, :note

    mount_uploader :image, PlatformimageUploader

    has_and_belongs_to_many :things
    belongs_to :webring

    has_friendly_id :name, use_slug: true

    scope :alphabetical, lambda {self.order(:name)}
    scope :visible, lambda {self.where(:public_visible => true)}

	before_save do
        self.set_default_menuname
    end

    def can_be_removed
        self.things.count == 0 ? true : false
    end

    protected

    def set_default_menuname
    	self.menuname = self.name if self.menuname == nil
    end

end
