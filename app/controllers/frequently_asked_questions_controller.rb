class FrequentlyAskedQuestionsController < ApplicationController
  def index
    @services = Service.displayed.root_services.order(title: :asc)
    @service = Service.find(params[:service_id]) if params[:service_id]
    @faqs = @service.present? ? @service.frequently_asked_questions.displayed.page(params[:page]).per(params[:per_page] || 25) : FrequentlyAskedQuestion.displayed.page(params[:page]).per(params[:per_page] || 25)
  end
end
