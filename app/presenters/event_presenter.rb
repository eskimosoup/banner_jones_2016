class EventPresenter < BasePresenter
  presents :event
  delegate :id, to: :event
end
