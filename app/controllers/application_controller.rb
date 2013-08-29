class ApplicationController < ActionController::Base

    protect_from_forgery

    helper_method :current_site, :current_about, :encrypt, :decrypt

    private

    def current_site
        site = Site.find_by_code(request.subdomain.split(".").first)
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
            session[:user] = "STUB"
            return true
        else
            return false
        end
    end

    def user_logged_in
        return true if session[:user] != nil
    end

    def must_login
        redirect_to '/' if !user_logged_in
    end

    def encrypt(value)
        secret = Digest::SHA1.hexdigest('ocd')
        code = ActiveSupport::MessageEncryptor.new(secret)
        return code.encrypt_and_sign(value.to_s)
    end

    def decrypt(value)
        begin
            secret = Digest::SHA1.hexdigest('ocd')
            code = ActiveSupport::MessageEncryptor.new(secret)
            return code.decrypt_and_verify(value.to_s)
        rescue
            #sign_out
        end
    end

end
