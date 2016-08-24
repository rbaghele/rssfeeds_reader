class RssEntry < ActiveRecord::Base
  belongs_to :rss_feed
end
