class SettingsController < ApplicationController

    layout 'ocd'

    before_filter :must_login

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
        @new_virtualcollection = Virtualcollection.new
        @new_virtualcollection.site_id = current_site.id
        @new_virtualcollection.name = params[:collection_name]
        @new_virtualcollection.save
        respond_to do |format|
            format.js
        end
    end

    def collection_edit
        @virtualcollection = Virtualcollection.find(decrypt(params[:id]))
        respond_to do |format|
            format.js { render :action => 'collections' }
        end
    end

    def collection_update
        @new_virtualcollection = Virtualcollection.find(decrypt(params[:id]))
        @new_virtualcollection.name = params[:name]
        @new_virtualcollection.save
        respond_to do |format|
            format.js { render :action => 'collections' }
        end
    end

    def collection_visibility
        @virtualcollection = Virtualcollection.find(decrypt(params[:id]))
        @virtualcollection.show_on_menu = !@virtualcollection.show_on_menu if params[:option] == 'show_on_menu'
        @virtualcollection.public_visible = !@virtualcollection.public_visible if params[:option] == 'public_visible'
        @virtualcollection.save
        render :nothing => true
    end

    def conditions
    end

    def condition_remove
    end

    def condition_insert
    end

    def condition_edit
    end

    def condtion_update
    end

    def condition_visibility
    end

    def tags
    end

end
