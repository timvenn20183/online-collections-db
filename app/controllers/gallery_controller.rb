class GalleryController < ApplicationController

	layout 'ocd'

    def item_view
        @item = Thing.where(:slug => params[:id]).first
        respond_to do |format|
            if !@item.mainimage.blank?
                format.js
            else
                render :nothing => true
            end
        end
    end

end
