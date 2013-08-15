class ItemsController < ApplicationController

	layout 'ocd'

    before_filter :must_login, :only => [:edit_list, :index]

    def search
        @search = params[:search]
        @items = current_site.things.all(:conditions => ['searchstring LIKE ?',"%#{@search}%"])
        @items = Array.new if @items == nil
        # session[:menu] = 'COL_' + @collection.cached_slug
        respond_to do |format|
            format.js { render 'items/list' }
            format.html { render 'items/list' }
        end
    end

    def settings_index
        @id = decrypt(params[:id]) if params[:id] != nil
        @alphabet_list = current_site.things.pluck(:alphabet_letter).uniq.sort
        @items = current_site.things.find_all_by_alphabet_letter(current_site.last_item_edit_list)
        @items = current_site.things.all if current_site.last_item_edit_list == 'ALL' or current_site.last_item_edit_list == nil
        @items = current_site.things.recent if current_site.last_item_edit_list == 'RECENT'
        @items = current_site.things.all if @items.blank?
    end

    def edit_list
        @letter = params[:letter]
        @items = current_site.things.find_all_by_alphabet_letter(@letter) if @letter != nil
        @items = current_site.things.recent if @letter == 'RECENT'
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
        @item = Thing.find(decrypt(params[:id]))
        @item.mainimage = params[:item][:mainimage].first if params[:item][:mainimage] != nil
        respond_to do |format|
            if @item.update_attributes(params[:item]) then
                format.js { redirect_to :action => 'settings_index', :id => encrypt(@item.id) }
            else
                format.js
            end
        end
    end

    def new
        @item = Thing.new
        respond_to do |format|
            format.js
        end
    end

    def create
        @new_item = Thing.new
        @new_item.site_id = current_site.id
        @new_item.update_attributes(params[:item])
        @site = Site.find(current_site.id)
        @site.last_item_edit_list = 'RECENT'
        @site.save
        respond_to do |format|
            format.js { redirect_to :action => 'settings_index', :id => encrypt(@new_item.id) }
        end
    end

    def list_options
        respond_to do |format|
            format.js
        end
    end

    def details_brief
        @item = Thing.find(params[:id])
        respond_to do |format|
            format.js
        end
    end

end
