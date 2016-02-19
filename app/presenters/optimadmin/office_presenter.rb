module Optimadmin
  class OfficePresenter < Optimadmin::BasePresenter
    presents :office
    delegate :id, :name, to: :office

    def toggle_title
      inline_detail_toggle_link(name)
    end

    def optimadmin_summary
      h.simple_format office.details
    end
  end
end
