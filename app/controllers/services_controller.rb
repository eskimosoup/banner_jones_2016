class ServicesController < ApplicationController
  before_action :find_service, only: :show
  before_action :find_member_service, except: :show

  include ResourceHelper, TwitterHelper

  def show
    # return redirect_to '/pages/wealth-management' if @service.title == 'Wealth Management' && params[:preview].blank?
    return redirect_to audience_service_path(@audience, @service), status: :moved_permanently if request.path != audience_service_path(@audience, @service)
    @onpage_navigations = @service.displayed_onpage_navigations
    @onpage_navigation_links = @onpage_navigations.displayed_navigation_link
    @offices = Office.unscoped.displayed.joins(:office_location).order('office_locations.name ASC')
    @hide_sticky_cta = true
    render layout: @service.layout
  end

  def testimonials
    return redirect_to audience_service_testimonials_path(@audience, @service), status: :moved_permanently if request.path != audience_service_testimonials_path(@audience, @service)
  end

  def frequently_asked_questions
    return redirect_to audience_service_frequently_asked_questions_path(@audience, @service), status: :moved_permanently if request.path != audience_service_frequently_asked_questions_path(@audience, @service)
  end

  private

  def find_member_service
    @audience = Audience.displayed.friendly.find(params[:audience_id])
    @service = @audience.services.displayed.friendly.find(params[:service_id])
  end

  def find_service
    audiences = (params[:preview].present? ? Audience.all : Audience.displayed)
    @audience = audiences.friendly.find(params[:audience_id])

    services = (params[:preview].present? ? @audience.services : @audience.services.displayed)
    @service = services.friendly.find(params[:id])
  end
end
