class Gallery < ActiveRecord::Base

    attr_accessible :name, :caption

    validates :name, :presence => true

    mount_uploader :image, GalleryimageUploader

    scope :active, order('created_at desc')

end
