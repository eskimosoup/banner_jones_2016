# frozen_string_literal: true

module ErrorHandling
  extend ActiveSupport::Concern

  included do
    unless Rails.application.config.consider_all_requests_local
      rescue_from Exception, with: ->(e) { render_error(500, e) }
      rescue_from ActiveRecord::RecordNotFound, with: ->(e) { render_error(404, e) }
      rescue_from ActionController::RoutingError, with: ->(e) { render_error(404, e) }
      rescue_from AbstractController::ActionNotFound, with: ->(e) { render_error(404, e) }
    end
  end

  def render_error(status, error)
    log_error(error)

    respond_to do |format|
      format.html do
        render "errors/#{status}",
               locals: { status: status, error: error }
      end

      format.all { head status }
    end
  end

  private

  def log_error(error)
    error_handling_logger.info [request.method, request.path].join(' ')
    error_handling_logger.error error.message
    error_handling_logger.debug error.backtrace.join("\n")
  end

  def error_handling_logger
    @error_handling_logger ||= ::Logger.new(
      File.join(Rails.root, 'log', 'error_handling.log'),
      3,
      5_242_880
    )
  end
end
