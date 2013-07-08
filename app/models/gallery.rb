class Gallery < ActiveRecord::Base

    attr_accessible :name, :caption

    validates :name, :presence => true

    mount_uploader :image, GalleryimageUploader

    has_friendly_id :name, use_slug: true

    has_many :blogs

    scope :active, order('created_at desc')

end
