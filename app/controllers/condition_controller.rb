class ConditionController < ApplicationController

    layout 'ocd'

    def index
        @condition = Condition.find_by_slug(params[:id])
        @header_text = @condition.name
        @items = @condition.things.paginate(:page => params[:page], :per_page => current_site_pagination)
        @items = Array.new if @items == nil
        session[:menu] = 'CON_' + @condition.slug
        respond_to do |format|
            format.js { render 'items/list' }
            format.html { render 'items/list' }
        end
    end


end
