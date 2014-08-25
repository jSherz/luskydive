# Provides helpers for rendering the events page
module EventsHelper
  def format_fb_datetime(raw_dt)
    dt = DateTime.iso8601(raw_dt)

    format_str = "%A #{dt.day.ordinalize} %B"

    # Check if there's a time included
    format_str = "%A #{dt.day.ordinalize} %B - %I:%M%p" if raw_dt.include? 'T'

    dt.strftime(format_str)
  end
end
