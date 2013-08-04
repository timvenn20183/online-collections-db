class RolodexController < ApplicationController

	layout 'ocd'

    def index
        @rolodex = Rolodex.find_by_cached_slug(params[:id])
        @items = @rolodex.things
        @items = Array.new if @items == nil
        session[:menu] = 'ROL_' + @rolodex.cached_slug
        respond_to do |format|
            format.js { render 'items/list' }
            format.html { render 'items/list' }
        end

    end

end
