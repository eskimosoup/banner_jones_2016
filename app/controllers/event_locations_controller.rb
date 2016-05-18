class EventLocationsController < ApplicationController
  before_action :find_event_location

  def show
    return redirect_to event_location_path(@event_location), status: :moved_permanently if request.path != event_location_path(@event_location)
    @events = @event_location.events.displayed.page(params[:page]).per(params[:per_page] || 15)
    @event_categories = EventCategory.displayed
    render 'events/index'
  end

  private

  def find_event_location
    @event_location = EventLocation.displayed.friendly.find(params[:id])
  end
end
