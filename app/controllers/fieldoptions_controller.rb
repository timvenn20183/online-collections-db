class FieldoptionsController < ApplicationController

    layout 'ocd'

    def index
        @fieldoption = Fieldoption.find_by_cached_slug(params[:id])
        @items = @fieldoption.things
        @thingfield = @fieldoption.thingfield
        session[:menu] = @thingfield.cached_slug + '_' + @fieldoption.cached_slug
        respond_to do |format|
            format.js { render 'items/list' }
            format.html { render 'items/list' }
        end
    end

end
