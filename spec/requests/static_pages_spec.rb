require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do
    it "should have the content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit 'static_pages/home'
      expect(page).to have_content('Sample App')
    end
    it "Should not have a custom title" do
      visit 'static_pages/home'
      expect(page).not_to have title('| home')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit 'static_pages/help'
      expect(page).to have_content('Help')
    end
    it "should have the title 'Help'" do
      visit 'static_pages/help'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do
    it "should have the content 'About Us'" do
      visit 'static_pages/about'
      expect(page).to have_content('About')
    end
    it "should have the title 'About Us'" do
      visit 'static_pages/about'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About")
    end
  end

  describe "Contact page" do
    
    it "should have the content 'Contact'" do
      visit 'static_pages/contact'
      expect(page).to have_content('Contact')
    end

    it "should have title 'Contact'" do
      visit 'static_pages/contact'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Contact")
    end
  end
end
