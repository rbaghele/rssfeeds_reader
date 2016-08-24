class RssFeedsController < ApplicationController
  before_action :set_rss_feed, only: [:edit, :show, :destroy, :update]

  def index
    @rss_feeds = RssFeed.all
  end

  def new
    @rss_feed = RssFeed.new
  end

  def create
    @rss_feed = RssFeed.new(rss_feed_params)
    
    if @rss_feed.save
      flash[:success] = 'Rss feed created successfully.'
      redirect_to rss_feeds_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @rss_feed.update_attributes(rss_feed_params)
      flash[:success] = 'Rss feed updated successfully.'
      redirect_to rss_feed_url(@rss_feed)
    else
      render 'edit'
    end
  end

  def destroy
    @rss_feed.destroy
    flash[:success] = 'Rss Feed Deleted Successfully.'
    redirect_to rss_feeds_url
  end

  def feed_entries
    @feed_entries = RssEntry.order('published desc').paginate(:page => params[:page], :per_page => 10)
  end

  private
    
    def set_rss_feed
      @rss_feed = RssFeed.find(params[:id])
    end

    def rss_feed_params
      params.require(:rss_feed).permit(:name, :url)
    end
end
