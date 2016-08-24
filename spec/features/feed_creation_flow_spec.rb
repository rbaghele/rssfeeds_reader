require "rails_helper"

RSpec.feature "Rss Feed creation", :type => :feature do
  scenario "User creates a new rss feed" do
    visit "/"

    click_link('Create Rss Feed')

    find('#rss_feed_name').set("Test 123")
    find('#rss_feed_url').set("http://timesofindia.indiatimes.com/rssfeedstopstories.cms")

    click_button "Create"

    expect(page).to have_text("Test 123")
  end
end