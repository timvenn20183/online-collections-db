class RolodexController < ApplicationController

	layout 'ocd'

    def index
        @rolodex = Rolodex.find_by_slug(params[:id])
        @items = @rolodex.things.paginate(:page => params[:page], :per_page => current_site_pagination)
        @items = Array.new if @items == nil
        session[:menu] = 'ROL_' + @rolodex.slug
        respond_to do |format|
            format.js { render 'items/list' }
            format.html { render 'items/list' }
        end

    end

end
