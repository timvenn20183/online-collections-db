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
        redirect_to '/welcome' if @site.blank?
        session[:menu] = "HOME"
    end

    def welcome
    end

    def about
        session[:menu] = "ABOUT"
        respond_to do |format|
            format.js
            format.html
        end
    end

    def sign_up
       respond_to do |format|
            if !user_logged_in then
                format.js
            else
                format.js { render :action => 'login_process' }
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
end
