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

    def about_on_menu
        @site = Site.find(current_site.id)
        @site.show_about = !@site.show_about
        @site.save
        render :nothing => true
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

    def homepage
        @site = current_site
    end

    def homepage_update
        @site = Site.find(current_site.id)
        @site.homepage_options[:about_is_homepage] = !@site.homepage_options[:about_is_homepage] if params[:about_is_homepage] == '1'
        @site.homepage_options[:last_x_items] = params[:last_x_items].to_i if params[:last_x_items] != nil
        @site.homepage_options[:random_item] = !@site.homepage_options[:random_item] if params[:random_item] == '1'       
        @site.save
        render :nothing => true
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
        @condition = Condition.find(decrypt(params[:id]))
        respond_to do |format|
            if !@condition.nil?
                if @condition.destroy
                    format.js { render :action => 'condition_removed' }
                else
                    format.js { render :action => 'condition_notremoved' }
                end
            else
                format.js { render :action => 'condition_notremoved' }
            end
        end

    end

    def condition_insert
        @new_condition = Condition.new
        @new_condition.site_id = current_site.id
        @new_condition.name = params[:condition_name]
        @new_condition.save
        respond_to do |format|
            format.js
        end
    end

    def condition_edit
        @condition = Condition.find(decrypt(params[:id]))
        respond_to do |format|
            format.js { render :action => 'conditions' }
        end
    end

    def condition_update
        @new_condition = Condition.find(decrypt(params[:id]))
        @new_condition.name = params[:name]
        @new_condition.save
        respond_to do |format|
            format.js { render :action => 'conditions' }
        end

    end

    def condition_visibility
        @condition = Condition.find(decrypt(params[:id]))
        @condition.show_on_menu = !@condition.show_on_menu if params[:option] == 'show_on_menu'
        @condition.save
        render :nothing => true

    end

    def rolodex
    end

    def rolodex_insert
        @new_rolodex = Rolodex.new
        @new_rolodex.site_id = current_site.id
        @new_rolodex.name = params[:rolodex_name]
        @new_rolodex.save
        respond_to do |format|
            format.js { render :action => 'rolodex' }
        end
    end

    def rolodex_edit
        @rolodex = Rolodex.find(decrypt(params[:id]))
        respond_to do |format|
            format.js { render :action => 'rolodex' }
        end
    end

    def rolodex_update
        @new_rolodex = Rolodex.find(decrypt(params[:id]))
        @new_rolodex.name = params[:name]
        @new_rolodex.save
        respond_to do |format|
            format.js { render :action => 'rolodex' }
        end
    end

    def rolodex_remove
        @rolodex = Rolodex.find(decrypt(params[:id]))
        @rolodex.destroy
        respond_to do |format|
            format.js { render :action => 'rolodex' }
        end
    end

    def rolodex_visibility
        @rolodex = Rolodex.find(decrypt(params[:id]))
        @rolodex.show_on_menu = !@rolodex.show_on_menu
        @rolodex.save
        render :nothing => true
    end

    def nav_menu
        @site = Site.find(current_site.id)
        @site.nav_menu = !@site.nav_menu
        @site.save
        render :nothing => true
    end


end
