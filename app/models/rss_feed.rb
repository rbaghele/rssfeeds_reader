class RssFeed < ActiveRecord::Base
  validates_presence_of :name, :url

  has_many :rss_entries, dependent: :destroy

  before_create :load_rss_feeds!

  def load_rss_feeds!
    feed_loder = RssFeedsLoader.new(self)
    feed_loder.process!
  end
end
