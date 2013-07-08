class PlatformController < ApplicationController

	layout 'oldcomputers'

	def index
		@platform = Platform.find_by_cached_slug(params[:id])
		@items = @platform.things
		@items = Array.new if @items == nil
	end

end
