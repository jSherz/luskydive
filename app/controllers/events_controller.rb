# Displays events, pulled from Facebook
class EventsController < ApplicationController
  rescue_from Koala::Facebook::AuthenticationError, with: :lookup_error

  def index
    @events = Event.all
  end

  def lookup_error
    render 'lookup_error', status: 500
  end
end
