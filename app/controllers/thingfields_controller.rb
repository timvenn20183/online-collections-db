class ThingfieldsController < ApplicationController

    layout 'ocd'

    def fieldoptions_edit_list
        @thingfield = Thingfield.find(decrypt(params[:id]))
        respond_to do |format|
            format.js
        end
    end

    def fieldoption_visibility
        @fieldoption = Fieldoption.find(decrypt(params[:id]))
        @fieldoption.show_on_menu = !@fieldoption.show_on_menu if params[:option] == 'show_on_menu'
        @fieldoption.save
        render :nothing => true
    end

    def fieldoption_edit
        @fieldoption = Fieldoption.find(decrypt(params[:id]))
        @thingfield = @fieldoption.thingfield
        respond_to do |format|
            format.js { render :action => 'fieldoptions_edit_list'}
        end
    end

    def fieldoption_update
        @new_fieldoption = Fieldoption.find(decrypt(params[:id]))
        @new_fieldoption.name = params[:name]
        @new_fieldoption.save
        @thingfield = @new_fieldoption.thingfield
        respond_to do |format|
            format.js { render :action => 'fieldoptions_edit_list'}
        end
    end

    def fieldoption_insert
        @new_fieldoption = Fieldoption.new
        @new_fieldoption.site_id = current_site.id
        @new_fieldoption.name = params[:fieldoption_name]
        @new_fieldoption.thingfield = Thingfield.find(decrypt(params[:thingfield_id]))
        @new_fieldoption.save
        @thingfield = @new_fieldoption.thingfield
        respond_to do |format|
            format.js { render :action => 'fieldoptions_edit_list'}
        end

    end

    def fieldoption_remove
        @fieldoption = Fieldoption.find(decrypt(params[:id]))
        @thingfield = @fieldoption.thingfield
        @fieldoption.destroy
        respond_to do |format|
            format.js { render :action => 'fieldoptions_edit_list'}
        end
    end
end
