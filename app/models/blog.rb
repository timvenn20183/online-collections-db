class Blog < ActiveRecord::Base

    has_and_belongs_to_many :categories
    belongs_to :gallery

    validates :name, :presence => true

    attr_accessible :cached_slug, :content, :draft, :front_page, :name, :order, :publish_date, :withdraw_date, :trashed, :gallery_id

    after_initialize :assign_blog_defaults, if: 'new_record?'

    has_friendly_id :name, use_slug: true

    scope :active, lambda {where(trashed: false, :draft => false)}
    scope :editable, lambda {where(trashed: false)}
    scope :current, lambda {self.all(:conditions => ['trashed = ? and draft = ? and ? >= publish_date and ? <= withdraw_date', false, false, Date.current, Date.current])}
    scope :frontpage, lambda {self.all(:conditions => ['front_page = ? and trashed = ? and draft = ? and ? >= publish_date and ? <= withdraw_date',true, false, false, Date.current, Date.current])}

    public

    def readmore
        read = ""
        ActionView::Base.full_sanitizer.sanitize(self.content).split("\r\n")[0].split(" ")[0..20].each do |words|   
            read = read + words + " "
        end
        return read

    end

    protected

    before_save do
        self.draft = true if self.content.blank? 
    end
    
    def assign_blog_defaults
        self.last_edited_date = Time.current if self.last_edited_date == nil
        self.views = 0 if self.views == nil
        self.withdraw_date = Date.current+2.weeks  
        self.publish_date = Date.current
        self.trashed = false if self.trashed == nil
        self.categories << Category.find_or_create_by_name(:name => "Uncategorized") if self.categories.size == 0
    end

end
