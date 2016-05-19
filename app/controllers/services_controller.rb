class ServicesController < ApplicationController
  before_action :find_service, only: :show

  include ResourceHelper, TwitterHelper

  def show
    return redirect_to audience_service_path(@audience, @service), status: :moved_permanently if request.path != audience_service_path(@audience, @service)
    @onpage_navigations = @service.displayed_onpage_navigations
    @onpage_navigation_links = @onpage_navigations.displayed_navigation_link
    @offices = Office.displayed
    @hide_sticky_cta = true
  end

  def testimonials
    @audience = Audience.find(params[:audience_id])
    @service = @audience.services.find(params[:service_id])
    return redirect_to audience_service_testimonials_path(@audience, @service), status: :moved_permanently if request.path != audience_service_testimonials_path(@audience, @service)
  end

  private

  def find_service
    @audience = Audience.find(params[:audience_id])
    @service = @audience.services.find(params[:id])
  end
end
