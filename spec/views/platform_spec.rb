require 'spec_helper'

describe "platform/_all_things_by_platform.html.erb",:type => :view do
    it "renders a list of things for a specific platform page" do
        render :handlers => [:erb], :template => 'platform/all_things_by_platform'
        expect(rendered).to include("Atari")
    end
end

