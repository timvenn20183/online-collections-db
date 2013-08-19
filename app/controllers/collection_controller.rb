class CollectionController < ApplicationController

	layout 'ocd'

	def index
		@collection = Virtualcollection.find_by_slug(params[:id])
		@items = @collection.things
		@items = Array.new if @items == nil
        session[:menu] = 'COL_' + @collection.slug
        respond_to do |format|
            format.js { render 'items/list' }
            format.html { render 'items/list' }
        end
	end

end
