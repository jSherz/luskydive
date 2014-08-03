module EventsHelper

  def format_fb_datetime(raw_dt)
    dt = DateTime.iso8601(raw_dt)

    format_str = "%A #{dt.day.ordinalize} %B"

    # Check if there's a time included
    if raw_dt.include? 'T'
      format_str = "%A #{dt.day.ordinalize} %B - %I:%M%p"
    end

    dt.strftime(format_str)
  end
end
