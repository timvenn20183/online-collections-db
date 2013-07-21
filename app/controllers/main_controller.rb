class MainController < ApplicationController

    layout 'ocd'

    def index
        @site = current_site
        @about = current_about
    end

    def login
        respond_to do |format|
            if !user_logged_in then
                format.js
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
