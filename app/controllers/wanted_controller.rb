class WantedController < ApplicationController

    layout 'ocd'

    before_filter :must_login

    def index
        @wanteds = current_site.wanteds.reverse!
        respond_to do |format|
            format.js
        end
    end

    def insert
        @site = Site.find(current_site.id)
        @wanted = Wanted.new
        @wanted.site = @site
        @wanted.name = params[:name]
        respond_to do |format|
            if @wanted.save then
                @id = @wanted.id
                @wanteds = current_site.wanteds.reverse!
                format.js
            else
                render :nothing => true
            end
        end
    end

    def remove
        @wanted = Wanted.find(decrypt(params[:id]))
        @wanted.destroy
        @wanteds = current_site.wanteds.reverse!
        respond_to do |format|
            format.js { render :action => 'index' }
        end
    end

end
