require 'spec_helper'

describe MainController , :type => :controller do
    describe "GET #index" do
        it "should return the main index page" do
            get :index
            response.should render_template :index
        end
    end

end
