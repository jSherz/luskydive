class EventsController < ApplicationController
  def index
    # TODO: Replace with dynamic auth string & group ID
    @events = Rails.cache.fetch('events')

    if @events == nil
      graph = Koala::Facebook::API.new(Rails.application.config.facebook_access_token)
      
      @events = graph.get_connections(Rails.application.config.facebook_group_id, 'events')

      # Only past week & future events
      show_from = 1.week.ago

      @events.select! { |event,|
        DateTime.iso8601(event['start_time']) > show_from
      }

      Rails.cache.write('events', @events, expires_in: 5.minute)
    end

    p @events
  end
end
