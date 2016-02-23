module Optimadmin
  class EventPresenter < Optimadmin::BasePresenter
    presents :event
    delegate :id, :title, to: :event

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format event.summary
    end
  end
end
