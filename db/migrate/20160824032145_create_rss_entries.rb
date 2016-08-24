class CreateRssEntries < ActiveRecord::Migration
  def change
    create_table :rss_entries do |t|
      t.string :title
      t.text :content
      t.string :url
      t.string :author
      t.integer :rss_feed_id
      t.datetime :published 
      t.timestamps null: false
    end
  end
end
