module Services
  class ResourcesController < ApplicationController
    before_action :find_service
    skip_before_action :set_seo_variables

    def show
      @resource = @service.resources.displayed.find(params[:id])
      @other_resources = @service.resources.displayed.where.not(id: @resource.id)
      set_seo_variables(@resource)
      @offices = ::Office.displayed.joins(:office_location).order('office_locations.name ASC')
      @contact = ::Contact.new if @service.landing_page?
      @offices = nil if @service.hide_preferred_office_on_forms?
      render layout: 'landing_page_design'
    end

    private

    def find_service
      @service = Service.displayed.find(params[:service_id])
    end

    def set_seo_variables(resource)
      seo_entry = SeoEntry.find_by(nominal_url: resource_path(resource))
      return unless seo_entry
      @rich_snippet = seo_entry.rich_snippet
      @title = seo_entry.title
      @meta_description = seo_entry.meta_description
      @meta_tags = seo_entry.title
    end
  end
end
