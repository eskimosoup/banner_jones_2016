class ServicesController < ApplicationController
  before_action :find_audience
  # before_action :find_service, only: :show
  # before_action :find_member_service, except: :show

  skip_before_action :set_seo_variables, only: :show
  include ResourceHelper
  include TwitterHelper
  include ConveyancingQuotes::UserSetup

  def show
    @service = find_service
    set_up_conveyancing_quote(ConveyancingQuotes::QuoteLocation.first) if @service.style == 'conveyancing'
    # return redirect_to '/pages/wealth-management' if @service.title == 'Wealth Management' && params[:preview].blank?
    return redirect_to nested_services_path(@service), status: :moved_permanently if request.path != nested_services_path(@service) # unless @service.friendly_id == params[:id]
    set_seo_variables(@service)
    @onpage_navigations = @service.inherit_page_layout_content? ? @service.root.displayed_onpage_navigations : @service.displayed_onpage_navigations
    @onpage_navigation_links = @onpage_navigations.displayed_navigation_link
    @offices = Office.unscoped.displayed.joins(:office_location).order('office_locations.name ASC')
    @contact = Contact.new if @service.landing_page?
    @offices = nil if @service.hide_preferred_office_on_forms?
    stamp_duty if @service.style == 'stamp_duty_calculator'
    render layout: @service.layout
  end

  def testimonials
    @service = find_service
    return redirect_to nested_testimonials_path(@service), status: :moved_permanently if request.path != nested_testimonials_path(@service)
  end

  def frequently_asked_questions
    @service = find_service
    return redirect_to nested_faqs_path(@service), status: :moved_permanently if request.path != nested_faqs_path(@service)
  end

  private

  def stamp_duty
    @stamp_duty_calculator = ConveyancingQuotes::StampDutyCalculator.new
  end

  def nested_testimonials_path(service)
    if service.parent.present? && service.parent.parent.present?
      audience_child_service_testimonials_path(service.audience, service.parent.parent, service.parent, service)
    elsif service.parent.present?
      audience_service_service_testimonials_path(service.audience, service.parent, service)
    else
      audience_service_testimonials_path(service.audience, service)
    end
  end

  def nested_faqs_path(service)
    if service.parent.present? && service.parent.parent.present?
      audience_child_service_frequently_asked_questions_path(service.audience, service.parent.parent, service.parent, service)
    elsif service.parent.present?
      audience_service_service_frequently_asked_questions_path(service.audience, service.parent, service)
    else
      audience_service_frequently_asked_questions_path(service.audience, service)
    end
  end

  def nested_services_path(service)
    if service.parent.present? && service.parent.parent.present?
      audience_child_service_path(service.audience, service.parent.parent, service.parent, service)
    elsif service.parent.present?
      audience_service_service_path(service.audience, service.parent, service)
    else
      audience_service_path(service.audience, service)
    end
  end

  def find_audience
    audiences = (params[:preview].present? ? Audience.all : Audience.displayed)
    @audience = audiences.friendly.find(params[:audience_id])
  end

  def find_member_service
    @service = @audience.services.displayed_or_landing_page.friendly.find(params[:service_id])
  end

  def find_service
    services = (params[:preview].present? ? @audience.services : @audience.services.displayed_or_landing_page)
    @service = services.friendly.find(param_id)
  end

  def param_id
    if params[:id].present?
      params[:id]
    elsif params[:nested_id].present?
      params[:nested_id]
    elsif params[:service_nested_id].present?
      params[:service_nested_id]
    elsif params[:service_id].present?
      params[:service_id]
    end
  end

  def set_seo_variables(service)
    seo_entry = SeoEntry.find_by(nominal_url: audience_service_path(service.audience, service))
    return unless seo_entry
    @rich_snippet = seo_entry.rich_snippet
    @title = seo_entry.title
    @meta_description = seo_entry.meta_description
    @meta_tags = seo_entry.title
  end
end
