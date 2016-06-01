class Services::PagesController < ApplicationController
  before_action :find_service_page, :find_member_service

  def show
    return redirect_to audience_service_service_page_path(@page.service.audience, @page.service, @page), status: :moved_permanently if request.path != audience_service_service_page_path(@page.service.audience, @page.service, @page)
    render layout: @page.layout
  end

  private

  def find_service_page
    @page = Services::Page.displayed.friendly.find(params[:id])
  end

  def find_member_service
    @audience = Audience.friendly.find(params[:audience_id])
    @service = @audience.services.friendly.find(params[:service_id])
  end
end
