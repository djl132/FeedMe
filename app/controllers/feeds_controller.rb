class FeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_enricher

  def user
    @user = User.find(params[:id])
    user_feed = client.feed('user', @user.id)
    results = user_feed.get()['results']

    puts "results: #{results.inspect}"

    @activities = @enricher.enrich_activities(results)
    pp "THESE ARE ACTIVITIES: #{@activities.inspect}"
  end

  # def flat
  #   feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:flat]
  #   results = feed.get['results']
  #   @activities = @enricher.enrich_activities(results)
  # end

  private

  def create_enricher
    @enricher = StreamRails::Enrich.new
  end
end
