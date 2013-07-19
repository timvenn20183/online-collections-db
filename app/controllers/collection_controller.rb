class CollectionController < ApplicationController

	layout 'ocd'

	def index
        @site = current_site
        @about = current_about
        render :text => 'done'
		#@collection = Virtualcollection.find_by_cached_slug(params[:id])
		#@items = @collection.things
		#@items = Array.new if @items == nil
	end

end
