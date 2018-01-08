class FrequentlyAskedQuestionsController < ApplicationController
  layout 'landing_page_design'

  def index
    @service_ids = Services::Faq.unscope(:order).select(:service_id).distinct.pluck(:service_id)
    @audiences = Audience.displayed
    @service = Service.find(params[:service_id]) if params[:service_id]
    @faqs = @service.present? ? @service.frequently_asked_questions.displayed.page(params[:page]).per(params[:per_page] || 25) : FrequentlyAskedQuestion.displayed.page(params[:page]).per(params[:per_page] || 25).limit(100)
  end
end
