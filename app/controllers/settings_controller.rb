class SettingsController < ApplicationController

    layout 'settings'

    def index
    end

    def site
        @site = Site.first
    end

    def site_update
        @site = Site.first
        if @site.update_attributes(params[:site])
        else
            render :action => 'site'
        end
    end

end
