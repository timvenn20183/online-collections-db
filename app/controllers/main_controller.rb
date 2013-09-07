class MainController < ApplicationController

    layout :select_layout

    def select_layout
        if action_name == 'welcome'
            return 'welcome'
        else
            return 'ocd'
        end
    end

    def index
        @site = current_site
        if @site.blank?
            redirect_to request.protocol + Ocd::Application.config.domain if @site.blank?
        end
        if !@site.blank? then
            if current_site.homepage_options[:last_x_items] != nil then
                if current_site.homepage_options[:last_x_items_images] == true then
                    @show_items = @site.things.where('mainimage <> ?','').last(current_site.homepage_options[:last_x_items])
                else
                    @show_items = @site.things.last(current_site.homepage_options[:last_x_items]) if current_site.homepage_options[:last_x_items] != nil
                end
            end
            if current_site.homepage_options[:random_x_items] != nil then
                if current_site.homepage_options[:random_x_items_images] == true then
                    @random_items = Thing.random_items_with_images(current_site) if current_site.homepage_options[:random_x_items]
                else
                    @random_items = Thing.random_items(current_site) if current_site.homepage_options[:random_x_items]
                end
            end
        end
        session[:menu] = "HOME"
    end

    def welcome
    end

    def about
        session[:menu] = "ABOUT"
        respond_to do |format|
            format.js
        end
    end

    def sign_up
       @site = Site.new
       respond_to do |format|
                format.js
                format.html { redirect_to request.protocol + Ocd::Application.config.domain }
        end
    end

    def sign_up_process
        @site = Site.new
        @site.header = params[:collection_name]
        @site.code = params[:collection_name]
        @site.email = params[:email]
        if params[:password] == params[:confirm] and !params[:password].blank? then
            @site.password = encrypt(params[:password])
            @site.password = nil if Signupvalidations.is_dictionary_word(params[:password]) == true
        else
            @site.password = nil
        end
        respond_to do |format|
            if @site.save then
                    format.js { render :action => 'sign_up_accepted' }
                    format.html { redirect_to request.protocol + Ocd::Application.config.domain }
            else
                    format.js { render :action => 'sign_up_process'}
                    format.html { redirect_to request.protocol + Ocd::Application.config.domain }
            end
        end
    end

    def login
        respond_to do |format|
            if !user_logged_in then
                format.js
                format.html
            else
                format.js { render :action => 'login_process' }
            end

        end
    end

    def login_process
        @email = params[:email]
        @password = params[:password]
        respond_to do |format|
            if login_user(@email, @password) then
                format.js { render :action => 'login_process' }
            else
                format.js { redirect_to '/' }
                format.html { redirect_to '/' }
            end
        end
    end

    def contact
        session[:menu] = "CONTACT"
    end

    def contact_save
        @name = params[:name]
        @email = params[:email]
        @comment = params[:comment]
        comment = Comment.new
        comment.site_id = current_site.id
        comment.email_address = @email
        comment.name = @name
        comment.detail = @comment
        comment.subject = "General site contact"
        respond_to do |format|
            if comment.save then
                format.js { render :action => 'contact_success'}
            else
                format.js { render :action => 'contact_failed'}
            end
        end
    end
end
