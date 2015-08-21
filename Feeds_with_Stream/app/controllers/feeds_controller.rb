class FeedsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_enricher

  def user
    @user = User.find(params[:id])
    feed = StreamRails.feed_manager.get_user_feed(@user.id)
    results = feed.get['results']
    @activities = @enricher.enrich_activities(results)
  end

  def flat
    feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:flat]
    results = feed.get['results']
    @activities = @enricher.enrich_activities(results)
  end

  def aggregated
    feed = StreamRails.feed_manager.get_news_feeds(current_user.id)[:aggregated]
    results = feed.get['results']
    @activities = @enricher.enrich_aggregated_activities(results)
  end

  def notification
    feed = StreamRails.feed_manager.get_notification_feed(current_user.id)
    results = feed.get['results']
    @activities = @enricher.enrich_aggregated_activities(results)
  end

  private

  def create_enricher
    @enricher = StreamRails::Enrich.new
  end
end
