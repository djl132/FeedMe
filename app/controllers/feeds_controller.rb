class FeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_enricher

  def user
    @user = User.find(params[:id])
    feed = StreamRails.feed_manager.get_user_feed(@user.id)
    puts "FEEDS: #{feed}"

    results = feed.get['results']
    puts "FEEDS: #{results}"

    @activities = @enricher.enrich_activities(results)
  end

  def flat
    feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:flat]
    results = feed.get['results']
    @activities = @enricher.enrich_activities(results)
  end

  private

  def create_enricher
    @enricher = StreamRails::Enrich.new
  end
end
