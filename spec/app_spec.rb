require_relative "../app"
require "capybara/rspec"
require "spec_helper"
Capybara.app = App



feature "URl shortener" do

  scenario "It displays a textfield with placeholder and a shorten button" do
    visit '/'
    fill_in "old_url", :with => "http://www.google.com"
    click_on "Shorten"
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("http://stagingurl.herokuapp.com/1")
  end
end