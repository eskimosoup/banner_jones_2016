class ErrorsController < ApplicationController
  layout 'landing_page_design'

  before_action :status_code

  def show
    render status_code.to_s, status: status_code
  end

  protected

  def status_code
    params[:code] || 500
  end
end
