class FieldoptionsController < ApplicationController

    layout 'ocd'

    def index
        @fieldoption = Fieldoption.find_by_slug(params[:id])
        @items = @fieldoption.things
        @thingfield = @fieldoption.thingfield
        session[:menu] = @thingfield.slug + '_' + @fieldoption.slug
        respond_to do |format|
            format.js { render 'items/list' }
            format.html { render 'items/list' }
        end
    end

end
