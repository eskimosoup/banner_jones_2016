class EventCategoriesController < ApplicationController
  before_action :find_event_category

  def show
    return redirect_to event_category_path(@event_category), status: :moved_permanently if request.path != event_category_path(@event_category)
    @events = @event_category.events.displayed.page(params[:page]).per(params[:per_page] || 15)
    @event_categories = EventCategory.displayed
    render 'events/index'
  end

  private

  def find_event_category
    @event_category = EventCategory.displayed.friendly.find(params[:id])
  end
end
