class Services::PagesController < ApplicationController
  before_action :find_service_page, :find_member_service

  def show
    return redirect_to audience_service_service_page_path(@page.service.audience, @page.service, @page), status: :moved_permanently if request.path != audience_service_service_page_path(@page.service.audience, @page.service, @page)
    @onpage_navigations = @service.displayed_onpage_navigations
    @onpage_navigation_links = @onpage_navigations.displayed_navigation_link
    @offices = Office.unscoped.displayed.joins(:office_location).order('office_locations.name ASC')
    render layout: @page.layout
  end

  private

  def find_service_page
    @page = Services::Page.displayed.friendly.find(params[:id])
  end

  def find_member_service
    @audience = Audience.displayed.friendly.find(params[:audience_id])
    @service = @audience.services.displayed_or_landing_page.friendly.find(params[:service_id])
  end
end
