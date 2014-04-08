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

    id = App::URLS.length
    expect(page).to have_content("example.com/#{id}")
    visit "/#{id}"
    expect(current_url).to eq("http://paulstone81.blogspot.com/")
  end

  scenario "It allows users to enter urls without the protocol" do
    visit '/'
    fill_in "old_url", :with => "google.com"
    click_on "Shorten"
    id = App::URLS.length
    visit "/#{id}"
    expect(current_url).to eq("http://google.com/")
  end

  scenario "It allows users to enter https urls" do
    visit '/'
    fill_in "old_url", :with => "https://google.com"
    click_on "Shorten"
    id = App::URLS.length
    visit "/#{id}"
    expect(current_url).to eq("https://google.com/")
  end

end