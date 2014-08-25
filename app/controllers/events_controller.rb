# Displays events, pulled from Facebook
class EventsController < ApplicationController
  def index
    # TODO: Replace with dynamic auth string & group ID
    @events = Rails.cache.fetch('events')

    # Bail if we failed to get any events
    return false if @events.nil?

    graph = Koala::Facebook::API.new(Rails.application.config.facebook_access_token)

    @events = graph.get_connections(Rails.application.config.facebook_group_id, 'events')

    # Only past week & future events
    show_from = 1.week.ago

    @events.select! do |event, |
      DateTime.iso8601(event['start_time']) > show_from
    end

    Rails.cache.write('events', @events, expires_in: 5.minute)
  end
end
