# Displays events, pulled from Facebook
class EventsController < ApplicationController
  def index
    @events = Event.all
  end
end
