class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  end

  def events
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

  def faqs()
    @faq_categories = FaqCategory.all

    id = (params[:id] or @faq_categories.first.id)

    @faq_category = @faq_categories.find(id.to_i)
  end
end
