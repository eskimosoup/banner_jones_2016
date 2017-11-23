class Services::PagesController < ApplicationController
  before_action :find_service_page, :find_member_service

  def show
    # return redirect_to audience_service_service_page_path(@page.service.audience, @page.service, @page), status: :moved_permanently if request.path != audience_service_service_page_path(@page.service.audience, @page.service, @page)
    return redirect_to nested_service_page_route(@service, @page) if request.path != nested_service_page_route(@service, @page)
    @onpage_navigations = @service.displayed_onpage_navigations
    @onpage_navigation_links = @onpage_navigations.displayed_navigation_link
    @offices = Office.unscoped.displayed.joins(:office_location).order('office_locations.name ASC')
    stamp_duty if @page.style == 'stamp_duty_calculator'
    render layout: @page.layout
  end

  private

  def stamp_duty
    @stamp_duty_calculator = ConveyancingQuotes::StampDutyCalculator.new
  end

  # oh my god, please forgive me :(
  def nested_service_page_route(service, page)
    if service.parent.present? && service.parent.parent.present?
      audience_child_service_page_path(service.audience, service.parent.parent, service.parent, service, page)
    elsif service.parent.present?
      audience_service_service_service_page_path(service.audience, service.parent, service, page)
    else
      audience_service_service_page_path(service.audience, service, page)
    end
  end

  def find_service_page
    @page = Services::Page.displayed.friendly.find(params[:id])
  end

  def find_member_service
    @audience = Audience.displayed.friendly.find(params[:audience_id])
    @service = @audience.services.displayed_or_landing_page.friendly.find(service_param_id)
  end

  def service_param_id
    if params[:service_nested_id].present?
      params[:service_nested_id]
    else
      params[:service_id]
    end
  end
end
