class FetchRecentFeeds
	@queue = :fetch_recent_feeds

	def self.perform(rss_feed_id)
		rss_feed = RssFeed.find(rss_feed_id)
		feed_loder = RssFeedsLoader.new(rss_feed)
    feed_loder.process!
	end
end