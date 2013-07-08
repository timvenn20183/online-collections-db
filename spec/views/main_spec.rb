require 'spec_helper'

describe "main/index.html.erb",:type => :view do
    it "renders the main welcome page" do
       # render :template  => 'main/index.html.erb'
        render :handlers => [:erb], :template => 'main/index'
        expect(rendered).to include(Dialog.find_by_key('welcome').comment[0..10])
    end
end

describe "main/_menu_virtual_links.html.erb", :type => :view do
    it "renders the virtual collections menu" do
        render :handlers => [:erb], :partial => 'main/menu_virtual_links'
        expect(rendered).to include("Collections")
    end
end

describe "main/_menu_platform_links.html.erb", :type => :view do
    it "renders the platforms menu" do
        render :handlers => [:erb], :partial => 'main/menu_platform_links'
        expect(rendered).to include("Platforms")
    end
end

describe "main/_menu_site_links.html.erb", :type => :view do
    it "renders the site links menu" do
        render :handlers => [:erb], :partial => 'main/menu_site_links'
        expect(rendered).to include("Site")
    end
end
