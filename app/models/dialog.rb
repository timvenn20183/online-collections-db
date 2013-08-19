class Dialog < ActiveRecord::Base

    belongs_to :site

    validates :content, :presence => true

end
