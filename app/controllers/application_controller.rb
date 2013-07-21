class ApplicationController < ActionController::Base

protect_from_forgery

    helper_method :current_site, :current_about, :encrypt, :decrypt

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

    def login_user(email,password)
        session[:user] = "STUB"
        return true
    end

    def user_logged_in
        return true if session[:user] != nil
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
