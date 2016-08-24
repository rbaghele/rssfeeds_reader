require 'nokogiri'
require 'open-uri'

class RssFeedsLoader
  attr_accessor :rss_feed

  def initialize(rss_feed)
    @rss_feed = rss_feed
  end

  def process!
    open(@rss_feed.url) do |rss_feeds|
      parser = FeedResponseParser.new(rss_feeds)
      parser.fetch_entries!
      
      parser.entries.each do |data|
        @rss_feed.rss_entries << build_rss_entry!(data)
      end
    end
  end

  def build_rss_entry!(data)
    RssEntry.new(data)
  end
end