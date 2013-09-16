class ApplicationController < ActionController::Base

    protect_from_forgery

    helper_method :current_site, :current_about, :user_logged_in, :current_homepage_note

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
        return current_site.dialogs.where(:code => 'ABOUT',:site_id => current_site.id).first_or_create do |dialog|
            dialog.content = 'Tell us something about yourself and your collection'
        end
    end

    def current_homepage_note
        return current_site.dialogs.where(:code => 'HOMEPAGE', :site_id => current_site.id).first_or_create do |dialog|
            dialog.content = 'Welcome people to your site and tell then briefly what they will find'
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

    def current_site_pagination
        if current_site.item_view_options[:pagination].to_i > 0 then
            return current_site.item_view_options[:pagination].to_i
        else
            return current_site.things.count
        end
    end

    def must_paginate
        return true if current_site.item_view_options[:pagination].to_i > 0
    end

end
