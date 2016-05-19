class TestimonialsController < ApplicationController
  def index
    @services = Service.displayed.root_services.order(title: :asc)
    @service = Service.find(params[:service_id]) if params[:service_id]
    @testimonials = @service.present? ? @service.testimonials.displayed.page(params[:page]).per(params[:per_page] || 25) : Testimonial.displayed.page(params[:page]).per(params[:per_page] || 25).limit(100)
  end
end
