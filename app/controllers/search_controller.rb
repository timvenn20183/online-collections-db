class SearchController < ApplicationController

    def collection
        @virtualcollections = current_site.virtualcollections.where("name like ?", "%#{params[:q]}%")
        respond_to do |format|
            format.json { render :json => @virtualcollections.map(&:attributes) }
        end
    end

    def condition
        @conditions = current_site.conditions.where("name like ?", "%#{params[:q]}%")
        respond_to do |format|
            format.json { render :json => @conditions.map(&:attributes) }
        end

    end

    def rolodex
        @rolodexes = current_site.rolodexes.where("name like ?", "%#{params[:q]}%")
        respond_to do |format|
            format.json { render :json => @rolodexes.map(&:attributes) }
        end
    end

    def fieldoption
        @fieldoptions = current_site.fieldoptions.where("name like ?", "%#{params[:q]}%")
        respond_to do |format|
            format.json { render :json => @fieldoptions.map(&:attributes) }
        end
    end

end
