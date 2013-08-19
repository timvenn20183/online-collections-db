class Gallery < ActiveRecord::Base

    validates :name, :presence => true

    mount_uploader :image, GalleryimageUploader

    scope :active, order('created_at desc')

end
