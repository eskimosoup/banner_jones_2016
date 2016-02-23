module Optimadmin
  class EventLocationPresenter < Optimadmin::BasePresenter
    presents :event_location
    delegate :id, :building_name, to: :event_location

    def toggle_title
      inline_detail_toggle_link(building_name)
    end

    def optimadmin_summary
      h.simple_format event_location.address_fields
    end
  end
end
