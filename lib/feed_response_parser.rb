class FeedResponseParser
  attr_accessor :doc, :entries

  def initialize(response)
    @doc = Nokogiri::XML(response)
    @entries = []
  end

  def fetch_entries!
    items = doc.xpath("//rss//channel//item")
    items.each do |item|
      @entries << {
        title: item.at('title').text,
        url: item.at('link').text,
        content: item.at('description').text,
        published: (item.at('pubDate').text.to_datetime rescue nil)
      }
    end
  end
end