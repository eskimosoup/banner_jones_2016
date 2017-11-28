module Services
  class ResourcesController < ApplicationController
    before_action :find_service

    def show
      @resource = @service.resources.displayed.find(params[:id])
      @offices = Office.unscoped.displayed.joins(:office_location).order('office_locations.name ASC')
      @contact = Contact.new if @service.landing_page?
      @offices = nil if @service.hide_preferred_office_on_forms?
      render layout: @service.layout
    end

    private

    def find_service
      @service = Service.displayed.find(params[:service_id])
    end
  end
end
