class ApplicationController < ActionController::Base

    protect_from_forgery

    helper_method :current_site, :current_about

    private

    def current_site
        site = Site.find_by_code(request.subdomain.split(".").first)
        if site != nil then
            site = nil if site.activation_code != nil
        end
        site = Site.first if Ocd::Application.config.single_mode == true
        return site
    end

    def current_about
        #stub
        return current_site.dialogs.where(:code => 'ABOUT').first_or_create do |dialog|
            dialog.content = 'About your collection'
        end
    end

    def logout_user
        session[:user] = nil
    end

    def login_user(email,password)
        @site = Site.find(current_site)
        if decrypt(@site.password) == password and email == @site.email then
            @site.password_retry = 0
            @site.save
            session[:user] = encrypt(current_site.code)
            return true
        else
            if email == @site.email then
                @site.password_retry = @site.password_retry + 1
                @site.save
            end
            return false
        end
    end

    def user_logged_in
        return true if session[:user] != nil
    end

    def must_login
        redirect_to '/' if !user_logged_in
    end

end
