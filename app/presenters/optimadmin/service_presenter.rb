module Optimadmin
  class ServicePresenter < Optimadmin::BasePresenter
    presents :service
    delegate :id, :title, to: :service

    def department_id
      service.department.id
    end

    def reorder_related_services
      return unless service.related_services.present?
      h.content_tag :div do
        h.link_to 'Re-order related services',
                  h.service_service_related_services_path(service)
      end
    end

    def toggle_title
      inline_detail_toggle_link(title)
    end

    def optimadmin_summary
      h.simple_format service.summary
    end
  end
end
