module Optimadmin
  class ServiceRelatedServicePresenter < Optimadmin::BasePresenter
    presents :service_related_service
    delegate :id, to: :service_related_service

    def related_service_title
      service_related_service.related_service.title
    end
  end
end
