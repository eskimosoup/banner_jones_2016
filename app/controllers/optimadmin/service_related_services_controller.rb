module Optimadmin
  class ServiceRelatedServicesController < Optimadmin::ApplicationController
    before_action :set_service

    def index
      @service_related_services = Optimadmin::BaseCollectionPresenter.new(collection: ServiceRelatedService.where(service_id: @service.id), view_template: view_context, presenter: Optimadmin::ServiceRelatedServicePresenter)
    end

    private

    def set_service
      @service = Service.find(params[:service_id])
    end

    def service_related_service_params
      params.require(:service_related_service).permit(:position)
    end
  end
end
