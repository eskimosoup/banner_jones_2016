module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :service
    delegate :id, :title, to: :service

    def department_id
      service.department.id
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format service.summary
    end
  end
end
