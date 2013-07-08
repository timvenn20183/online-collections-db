class VirtualcollectionController < ApplicationController

	layout 'oldcomputers'

	def index
		@collection = Virtualcollection.find_by_cached_slug(params[:id])
		@items = @collection.things
		@items = Array.new if @items == nil
	end

end
