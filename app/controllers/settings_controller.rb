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
        @collection = Virtualcollection.find(decrypt(params[:id]))
        respond_to do |format|
            if !@collection.nil?
                if @collection.destroy
                    format.js { render :action => 'collection_removed' }
                else
                    format.js { render :action => 'collection_notremoved' }
                end
            else
                format.js { render :action => 'collection_notremoved' }
            end
        end
    end

    def collection_insert
        @virtualcollection = Virtualcollection.new
        @virtualcollection.site_id = current_site.id
        @virtualcollection.name = params[:collection_name]
        @virtualcollection.save
        respond_to do |format|
            format.js
        end
    end

    def tags
    end

end
