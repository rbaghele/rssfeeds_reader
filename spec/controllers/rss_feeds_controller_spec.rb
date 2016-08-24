require 'rails_helper'

RSpec.describe RssFeedsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the feeds into @rss_feeds" do
      rss_feed1 = RssFeed.create!(name: 'TOI top stories', url: 'http://timesofindia.indiatimes.com/rssfeedstopstories.cms')
      rss_feed2 = RssFeed.create!(name: 'Rediff', url: 'http://www.rediff.com/rss/inrss.xml')
      
      get :index

      expect(assigns(:rss_feeds)).to match_array([rss_feed1, rss_feed2])
    end
  end

end
