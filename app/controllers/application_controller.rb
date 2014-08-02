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
      graph = Koala::Facebook::API.new('CAAH46mWjLUIBAHFz8GRgxuHZCUSR8afY0GmhLkYifr3YUi1tZAZC4hkoBdgf9TjZCdThoRDwr7m67Cz4IVTU21DJCwSivkmZCOJNmQbiarjK2xhXL1ip0ZBb9zFyRYEg2uPL8ZCZAHr8qgjxz63LiUTuvuxuen3UPtX8ZCwwY8nP472gbBgske915jTZCCbZBFRuFUD4tPecnK1pypjkHACw7Cb')
      
      @events = graph.get_connections('18228677368', 'events')

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
