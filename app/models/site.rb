class Site < ActiveRecord::Base

    has_many :virtualcollections
    has_many :conditions
    has_many :things
    has_many :thingfields
    has_many :fieldoptions
    has_many :rolodexes
    has_many :dialogs

    serialize :homepage_options, Hash
    serialize :item_view_options, Hash

    attr_accessible :code, :title, :meta_keywords, :meta_description, :email, :owner, :username, :password, :header, :tagline

    validates :header, :presence => true
    #validates :password, :presence => true
    validates :email, :presence => true, :uniqueness => true
    validates :code, :presence => true, :uniqueness => true

    before_save do
        self.set_homepage_options
        self.set_itemview_options
    end

    def set_homepage_options
        self.homepage_options[:about_is_homepage] = false if self.homepage_options[:about_is_homepage] == nil
        self.homepage_options[:last_x_items] = 0 if self.homepage_options[:last_x_items] == nil
        self.homepage_options[:random_x_items] = 0 if self.homepage_options[:random_x_items] == nil
     end

     def set_itemview_options
        # stub
        self.item_view_options[:list_type] = "accordion" if self.item_view_options[:list_type] == nil
     end
end
