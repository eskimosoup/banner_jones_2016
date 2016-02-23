class EventCategoryPresenter < BasePresenter
  presents :event_category
  delegate :id, to: :event_category
end
