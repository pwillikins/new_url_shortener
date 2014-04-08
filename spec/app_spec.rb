require_relative "../app"
require "capybara/rspec"
require "spec_helper"
Capybara.app = App

feature "URl shortener" do

  scenario "It displays a textfield with placeholder and a shorten button" do
    visit '/'
    fill_in "old_url", :with => "http://paulstone81.blogspot.com"
    click_on "Shorten"
    expect(page).to have_content("http://paulstone81.blogspot.com")
    expect(page).to have_content("example.com/1")
    visit '/1'
    expect(current_url).to eq("http://paulstone81.blogspot.com/")
  end
end