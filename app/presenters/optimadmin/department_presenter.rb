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

    def services
      h.link_to h.services_path(department_id: department.id) do
        h.pluralize(department.services_count, 'service')
      end
    end
  end
end
