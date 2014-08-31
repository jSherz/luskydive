# Retrieves Facebook events for the society group page.
class Event
  # Get & cache events
  def self.all
    @events = Rails.cache.fetch('events')

    # Bail if we failed to get any events
    return [] if @events.nil?

    graph = Koala::Facebook::API.new(Rails.application.config.facebook_access_token)

    @events = graph.get_connections(Rails.application.config.facebook_group_id, 'events')

    # Only past week & future events
    show_from = 1.week.ago

    @events.select! do |event, |
      DateTime.iso8601(event['start_time']) > show_from
    end

    # Cache events lookup
    Rails.cache.write('events', @events, expires_in: 5.minute)

    @events
  end
end