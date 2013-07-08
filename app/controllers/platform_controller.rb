class PlatformController < ApplicationController

	layout 'ocd'

	def index
		@platform = Platform.find_by_cached_slug(params[:id])
		@items = @platform.things
		@items = Array.new if @items == nil
	end

end
