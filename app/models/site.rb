    class Site < ActiveRecord::Base

    has_many :virtualcollections
    has_many :conditions
    has_many :things
    has_many :thingfields
    has_many :fieldoptions
    has_many :rolodexes
    has_many :dialogs
    has_many :comments

    serialize :homepage_options, Hash
    serialize :item_view_options, Hash
    serialize :menu_options, Hash
    serialize :contact_form, Hash

    mount_uploader :siteheader, SiteheaderUploader

    validate :validate_site #, on: :create

    before_save do
        self.set_homepage_options
        self.set_itemview_options
        self.set_menu_options
        self.set_lowercase_code
    end

    def validate_site
        errors.add(:email, "cannot be blank.") if self.email.blank?
        errors.add(:email, "is already registered. If you have lost your password please use the contact form on the website.") if !Site.where(:email => self.email).blank?
        errors.add(:code, "cannot be blank.") if self.code.blank?
        errors.add(:code, "is already in use.") if !Site.where(:code => self.code).blank?
        errors.add(:code, "is reserved.") if self.code.downcase == 'www'
        errors.add(:email, "appears to be invalid.") if self.email.split("@").count != 2
        errors.add(:email, "domain appears to be invalid.") if self.email.split("@").count == 2 and Signupvalidations.is_valid_domain(self.email.split("@")[1]) != true
        errors.add(:password, "is either blank, is a dictionary word or does not match") if self.password.blank?

    end

    def set_homepage_options
        self.homepage_options[:about_is_homepage] = false if self.homepage_options[:about_is_homepage] == nil
        self.homepage_options[:last_x_items] = 0 if self.homepage_options[:last_x_items] == nil
        self.homepage_options[:random_x_items] = 0 if self.homepage_options[:random_x_items] == nil
        self.homepage_options[:show_navbar] = true if self.homepage_options[:show_navbar] == nil
     end

     def set_itemview_options
        # stub
        self.item_view_options[:list_type] = "Accordion" if self.item_view_options[:list_type] == nil
     end

    def set_menu_options
        self.menu_options[:contact_on_menu] = true if self.menu_options[:contact_on_menu] == nil
    end

    def set_lowercase_code
        self.code = self.code.downcase if self.code != nil
    end

end
