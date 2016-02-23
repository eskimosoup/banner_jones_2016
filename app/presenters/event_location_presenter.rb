class EventLocationPresenter < BasePresenter
  presents :event_location
  delegate :id, to: :event_location
end
