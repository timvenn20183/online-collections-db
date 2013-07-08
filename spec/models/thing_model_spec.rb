require 'spec_helper'

describe Thing do
    it "has a valid name" do
        FactoryGirl.create(:thing).should be_valid
    end

    it "is invalid without a name" do
        FactoryGirl.build(:thing, :name => nil).should_not be_valid
    end
end

