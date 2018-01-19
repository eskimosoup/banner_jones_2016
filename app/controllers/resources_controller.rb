class ResourcesController < ApplicationController
  before_action :find_resource, only: :show
  before_action :load_resource_categories

  layout 'landing_page_design'

  def index
    @service_ids = Services::Resource.select(:service_id).distinct.pluck(:service_id)
    @audiences = Audience.displayed
    @service = Service.find(params[:service_id]) if params[:service_id]
    @resources = (@service.present? ? @service.resources.displayed.page(params[:page]).per(params[:per_page] || 15) : Resource.displayed.page(params[:page]).per(params[:per_page] || 15))
  end

  def show
    # redirect_to resources_path
    resource = @resource
    redirect_to (resource.services.present? && resource.services.first.audience.present? ? audience_service_resource_path(resource.services.first.audience, resource.services.first, resource) : resource.file.url)
  end

  private

  def find_resource
    @resource = Resource.displayed.friendly.find(params[:id])
  end

  def load_resource_categories
    @resource_categories = ResourceCategory.displayed
  end
end
