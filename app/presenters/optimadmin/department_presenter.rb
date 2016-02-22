module Optimadmin
  class DepartmentPresenter < Optimadmin::BasePresenter
    presents :department
    delegate :id, :title, to: :department

    def audience_id
      department.audience.id
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format department.summary
    end
  end
end
