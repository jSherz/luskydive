# Retrieves Facebook events for the society group page.
class Event
  # Get cached events or retrieve from FB
  def self.all
    Rails.cache.fetch('events') || all_events
  end

  def self.all_events
    graph = Koala::Facebook::API.new(Rails.application.config.facebook_access_token)
    @events = graph.get_connections(Rails.application.config.facebook_group_id, 'events')

    # Only past week & future events
    @events.select! do |event|
      DateTime.iso8601(event['start_time']) > 1.week.ago
    end

    # Cache events lookup
    Rails.cache.write('events', @events, expires_in: 5.minute) if @events

    @events
  end
end
