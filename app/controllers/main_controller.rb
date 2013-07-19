class MainController < ApplicationController

    layout 'ocd'

    def index
        @site = current_site
        @about = current_about
    end

end
