require 'spec_helper'

feature 'home page' do
    scenario "User clicks the home page" do
        visit '/'
        click_link "Home"
        # The welcome frame
        expect(page).to have_text('Welcome')
        # The site links menu
        expect(page).to have_text('Home')
        # The collections menu
        expect(page).to have_text('Collections')
        # The platforms menu
        expect(page).to have_text('Platforms')
    end
end

