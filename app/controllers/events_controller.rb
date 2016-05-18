class EventsController < ApplicationController
  before_action :find_event, only: :show
  before_action :set_event_categories

  def index
    @events = Event.displayed.page(params[:page]).per(params[:per_page] || 15)
    @event_locations = EventLocation.displayed
  end

  def show
    return redirect_to event_path(@event), status: :moved_permanently if request.path != event_path(@event)
    @related_events = Event.displayed.where.not(id: @event.id).limit(3)
  end

  private

  def find_event
    @event = Event.displayed.friendly.find(params[:id])
  end

  def set_event_categories
    @event_categories = EventCategory.displayed
  end
end
