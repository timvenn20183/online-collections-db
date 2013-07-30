class Thing < ActiveRecord::Base

    validates :name, :presence => true

    attr_accessible :active, :cost, :name, :value, :visability, :year, :collection_id, :cached_slug, :aquire_date, :aquired_from, :reference_number

    has_and_belongs_to_many :virtualcollections
    has_and_belongs_to_many :conditions
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :rolodexes
    has_and_belongs_to_many :medias
    belongs_to :site
    has_many :thingfields, :through => :fieldoptions
    has_and_belongs_to_many :fieldoptions, :join_table => 'fieldoptions_things'

    scope :recent_with_images, lambda {self.all(:limit => 5, :order => 'release_date desc', :conditions => ['release_date is not NULL and mainimage <> "" and release_date <= ? and public_visible = ?',Date.current,true])}
    scope :recent, lambda {self.all(:limit => 10, :order => 'updated_at desc')}

    mount_uploader :mainimage, MainimageUploader

    has_friendly_id :name, use_slug: true

    before_save do
        self.set_alphabet_letter
        self.set_value
        self.set_release_date
        self.build_search_string
        self.set_aquire_date
        self.set_aquired_from
    end

    after_initialize do
        self.year = Thing.average_year_of_release if self.year == nil
        self.views = 0 if self.views == nil
    end

    public

    def is_visible_to_public
        return self.public_visible
    end

    def self.remove_all_images
        Thing.all.each do |thing|
            thing.remove_mainimage!
            thing.save!
        end
    end

    def self.rebuild_all_images
        Thing.all.each do |thing|
            thing.mainimage.recreate_versions!
            thing.save
        end
    end

    def virtualcollection_string
        virtualcollection_string = String.new
        self.virtualcollections.all.each do |virtualcollection|
            virtualcollection_string = virtualcollection_string + virtualcollection.name + " / "
        end
        return virtualcollection_string[0..virtualcollection_string.length-4]
    end

    def condition_string
        condition_string = String.new
        self.conditions.all.each do |condition|
            condition_string = condition_string + condition.name + " / "
        end
        return condition_string[0..condition_string.length-4]
    end

    def category_string
        category_string = String.new
        self.categories.all.each do |category|
            category_string = category_string + category.name + " / "
        end
        return category_string[0..category_string.length-4]
    end

    def rolodex_string
        rolodex_string = String.new
        self.rolodexes.all.each do |rolodex|
            rolodex_string = rolodex_string + rolodex.name + " / "
        end
        return rolodex_string[0..rolodex_string.length-4]
    end

    protected

    def set_alphabet_letter
        self.alphabet_letter = self.name[0].upcase
    end

    def set_value
        self.value = self.cost if self.value == 0.00
    end

    def set_release_date
        if release_date.nil? and !mainimage.blank?
            thing = Thing.all(:conditions => ['release_date is not NULL'], :order => 'release_date').last
            if thing == nil then
                    self.release_date = Date.current+1.day
            else
            case (thing and thing.release_date)
            when nil
                self.release_date = Date.current+1.day
            else
                self.release_date = thing.release_date+1.day
            end
        end
        end
    end

    def self.average_year_of_release
        return Thing.average(:year).to_i
    end

    def build_search_string
        @searchstring = self.name + self.year.to_s
        self.virtualcollections.all.each do |virtualcollection|
            @searchstring = @searchstring + virtualcollection.name.gsub("/","").gsub("-","").gsub(" ","")
        end
        self.fieldoptions.all.each do |fieldoption|
            @searchstring = @searchstring + fieldoption.name.gsub("/","").gsub("-","").gsub(" ","")
        end
        self.searchstring = @searchstring
    end

    def set_aquire_date
        self.aquire_date = Date.current if self.aquire_date == nil
    end

    def set_aquired_from
        self.aquired_from = Rolodex.find_or_create_by_name(:name => 'Unknown').id if self.aquired_from == nil
    end

end
