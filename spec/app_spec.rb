require_relative "../app"
require "capybara/rspec"
require "spec_helper"
Capybara.app = App



feature "URl shortener" do

  scenario "It displays a textfield with placeholder and a shorten button" do
    visit '/'
    fill_in "old_url", :with => "http://www.google.com"
    click_on "Shorten"
  end
end