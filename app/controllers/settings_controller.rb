class SettingsController < ApplicationController

    layout 'ocd'

    before_filter :user_logged_in

    def index
        @site = current_site
    end

    def site
        @site = current_site
    end

    def site_update
        @site = current_site
        respond_to do |format|
            if @site.update_attributes(params[:site])
                format.js { render :action => 'success' }
            else
                format.js { render :action => 'failed' }
            end
        end
    end

    def about
        @about = current_about
    end

    def about_update
        @about = current_about
        @about.content = params[:about]
        respond_to do |format|
            if @about.save
                format.js { render :action => 'success' }
            else
                format.js { render :action => 'failed' }
            end
        end
    end

    def logout
        logout_user
        redirect_to :action => 'index', :controller => 'main'
    end

    def collections
    end

    def collection_remove
    end

    def tags
    end

end
