class RssFeed < ActiveRecord::Base
  validates_presence_of :name, :url

  has_many :rss_entries, dependent: :destroy

  after_save :load_rss_feeds!

  def load_rss_feeds!
  	Resque.enqueue(FetchRecentFeeds, self.id) if self.url_changed?
  end
end
