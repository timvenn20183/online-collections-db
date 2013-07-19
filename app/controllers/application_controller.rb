class ApplicationController < ActionController::Base

protect_from_forgery

    def current_site
        # stub
        return Site.first_or_create(:header => 'My collection')
    end

    def current_about
        # stub
        return Dialog.where(:code => 'ABOUT').first_or_create do |dialog|
            dialog.content = 'About your collection'
        end
    end

    def logout_user
        session[:user] = nil
    end

    def login_user
        session[:user] = "STUB"
    end

    def user_logged_in
        return true if session[:user] != nil
        redirect_to :action => 'login', :controller => 'main', :format => 'js'
    end

end
