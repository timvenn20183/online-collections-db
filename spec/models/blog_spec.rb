require 'spec_helper'

describe Blog do
    it "has a valid name" do
        FactoryGirl.create(:blog).should be_valid
    end

    it "is invalid without a name" do
        FactoryGirl.build(:blog, :name => nil).should_not be_valid
    end

    it "is invalid without content" do
        FactoryGirl.build(:blog, :content => nil).should_not be_valid
    end

    it "must default to being a draft" do
        blog = Blog.new
        blog.draft.should eq(true)
    end

    it "must default to the front page" do
        blog = Blog.new
        blog.front_page.should eq(true)
    end

    it "must have 0 as the default order" do
        blog = Blog.new
        blog.order.should eq(0)
    end

    it "may not have a nil publish date" do
        blog = Blog.new
        blog.publish_date.should_not eq(nil)
    end

    it "may not have a nil withdraw date" do
        blog = Blog.new
        blog.withdraw_date.should_not eq(nil)
    end

    it "must have at least one category" do
        blog = Blog.new
        blog.category_ids.size.should_not eq(0)
    end

    it "must always have the uncategorized category by default" do
        blog = Blog.new
        blog.category_ids.size.should_not eq(0)
    end

end
