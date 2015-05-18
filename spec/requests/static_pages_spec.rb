require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit '/home'
      expect(page).to have_content('Sample App')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/help'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit '/about'
      expect(page).to have_content('About')
    end
  end
end
