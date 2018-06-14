class TestimonialsController < ApplicationController
  def index
    @service_ids = Services::Testimonial.select(:service_id).distinct.pluck(:service_id)
    @audiences = Audience.displayed
    @service = Service.find(params[:service_id]) if params[:service_id]
    @testimonials = @service.present? ? @service.testimonials.displayed.page(params[:page]).per(params[:per_page] || 25) : Testimonial.displayed.page(params[:page]).per(params[:per_page] || 25).limit(100)
  end
end
