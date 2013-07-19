class MainController < ApplicationController

    layout 'ocd'

    def index
        @site = current_site
        @about = current_about
    end

    def login
        respond_to do |format|
            format.js
        end
    end

end
