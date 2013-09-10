class MainController < ApplicationController

    layout :select_layout

    def select_layout
        if action_name == 'welcome' or action_name == 'terms_and_conditions'
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
            if current_site.homepage_options[:last_x_items] > 0  then
                if current_site.homepage_options[:last_x_items_images] == true then
                    @show_items = @site.things.where('mainimage <> ?','').last(current_site.homepage_options[:last_x_items])
                else
                    @show_items = @site.things.last(current_site.homepage_options[:last_x_items]) if current_site.homepage_options[:last_x_items] != nil
                end
            end
            if current_site.homepage_options[:random_x_items] > 0 then
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
    end

    def sign_up
       @site = Site.new
       respond_to do |format|
                format.js
                format.html { redirect_to request.protocol + Ocd::Application.config.domain }
        end
    end

    def terms_and_conditions
        respond_to do |format|
            format.js
            format.html
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
        @site.activation_code = encrypt(@site.code)
        respond_to do |format|
            if @site.save then
                    UserMailer.activation_email(@site).deliver
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
                UserMailer.send_user_comment(comment).deliver
                format.js { render :action => 'contact_success'}
            else
                format.js { render :action => 'contact_failed'}
            end
        end
    end

    def activate_site
        code = params[:activation]
        if code.blank? then
            redirect_to request.protocol + Ocd::Application.config.domain
            return true
        end
        site_code = decrypt(code)
        site = Site.where(:code => site_code).first
        if site.blank? then
            redirect_to request.protocol + Ocd::Application.config.domain
            return true
        end
        site.activation_code = nil
        site.activation_date = Time.now if site.activation_date == nil
        site.save
        redirect_to request.protocol + site.code + "." + Ocd::Application.config.domain + '/activated'
    end

    def activated
        if current_site.blank? then
            redirect_to request.protocol + Ocd::Application.config.domain + "/" if current_site.blank?
            return true
        end
        if !current_site.blank? then
            redirect_to request.protocol + Ocd::Application.config.domain + "/" if current_site.activation_code != nil
        end
        site = Site.find(current_site)
        @recently_activated = false
        @recently_activated = true if site.activation_date > Time.now-5.seconds
    end

end
