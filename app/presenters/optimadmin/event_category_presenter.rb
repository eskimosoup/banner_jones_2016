module Optimadmin
  class EventCategoryPresenter < Optimadmin::BasePresenter
    presents :event_category
    delegate :id, :title, to: :event_category

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      #h.simple_format event_category.summary
    end
  end
end
