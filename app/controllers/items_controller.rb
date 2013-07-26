class ItemsController < ApplicationController

	layout 'ocd'

    before_filter :must_login, :only => [:edit_list, :index]

    def settings_index
        @alphabet_list = current_site.things.pluck(:alphabet_letter).uniq.sort
        @items = current_site.things.find_all_by_alphabet_letter(current_site.last_item_edit_list)
        @items = current.site.things.all if @items == nil
    end

    def edit_list
        @letter = params[:letter]
        @items = current_site.things.find_all_by_alphabet_letter(@letter) if @letter != nil
        @items = current_site.things.all(:order => ['updated_at desc'], :limit => 10) if @letter == 'RECENT'
        @items = current_site.things.all if @letter == 'ALL' or @letter == nil
        @site = Site.find(current_site.id)
        @site.last_item_edit_list = @letter
        @site.save
        respond_to do |format|
            format.js
        end
    end

    def edit
        @item = Thing.find(decrypt(params[:id]))
        respond_to do |format|
            format.js
        end
    end

    def update
    end

end
