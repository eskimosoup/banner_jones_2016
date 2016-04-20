class ServicesController < ApplicationController
  before_action :find_service

  include ResourceHelper, TwitterHelper

  def show
    return redirect_to audience_service_path(@audience, @service), status: :moved_permanently if request.path != audience_service_path(@audience, @service)
    @onpage_navigations = @service.displayed_onpage_navigations
    @onpage_navigation_links = @onpage_navigations.displayed_navigation_link
    @offices = Office.displayed
  end

  private

  def find_service
    @audience = Audience.find(params[:audience_id])
    @service = @audience.services.find(params[:id])
  end
end
