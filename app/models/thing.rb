class Thing < ActiveRecord::Base

    extend FriendlyId

    validates :name, :presence => true

    has_and_belongs_to_many :virtualcollections
    has_and_belongs_to_many :conditions
    has_and_belongs_to_many :categories
    has_and_belongs_to_many :rolodexes
    belongs_to :site
    has_many :thingfields, :through => :fieldoptions
    has_and_belongs_to_many :fieldoptions, :join_table => 'fieldoptions_things'

    scope :recent_with_images, lambda {self.all(:limit => 5, :order => 'release_date desc', :conditions => ['release_date is not NULL and mainimage <> "" and release_date <= ? and public_visible = ?',Date.current,true])}
    scope :recent, lambda {self.all(:limit => 10, :order => 'updated_at desc')}

    mount_uploader :mainimage, MainimageUploader

    friendly_id :name, use: :slugged

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

    def self.rebuild_all_images
        Thing.all.each do |thing|
            thing.mainimage.recreate_versions!
            thing.save
        end
    end

    def self.random_items(site)
        things = Array.new
        thing_ids = site.things.pluck(:id)
        begin
            thing_id = thing_ids[rand(thing_ids.count)]
            things << Thing.find(thing_id) if !things.include?(thing_id)
        end while things.count < site.homepage_options[:random_x_items]
        return things
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
