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
    message = error_message(status, error)
    responders(status, error)
    error_handling_logger.error(message)
    ExceptionHandling.new('.error_reporting', message).call if status == 500
  end

  def responders(status, error)
    respond_to do |format|
      format.html do
        render "errors/#{status}",
               locals: { status: status, error: error },
               status: status
      end

      format.all { head status }
    end
  end

  def error_message(status, error)
    message = [full_request]
    message << ['Referrer', request.referrer].join(' ') if request.referrer
    message << error.message
    message << error.backtrace.join("\n") if status == 500
    message.join("\n")
  end

  def full_request
    [
      [request.protocol, request.host_with_port, request.path].join(''),
      request.method
    ].join(' ')
  end

  def error_handling_logger
    @error_handling_logger ||= ::Logger.new(
      File.join(Rails.root, 'log', 'error_handling.log'),
      3,
      5_242_880
    )
  end

  class ExceptionHandling
    require 'digest/md5'

    def initialize(log_file, message)
      @log_file = log_file
      @message = message
      return unless exception_handling_email?
    end

    def call
      return if repeat_error?
      custom_logger.info(unique_id)
      send_email
    end

    private

    attr_reader :log_file, :message

    def repeat_error?
      File.exist?(log_file_path) &&
        File.foreach(log_file_path).any? { |l| l[unique_id] }
    end

    def unique_id
      [Date.today, hashed_error].join(' - ')
    end

    def hashed_error
      Digest::MD5.hexdigest(message.lines.first)
    end

    def send_email
      Thread.new do
        ActionMailer::Base.mail(
          from: APPLICATION_DEFAULTS[:exception_handling][:from_email],
          to: APPLICATION_DEFAULTS[:exception_handling][:to_email],
          subject: email_subject,
          body: message
        ).deliver_now
      end
    end

    def exception_handling_email?
      APPLICATION_DEFAULTS[:exception_handling][:from_email].present? &&
        APPLICATION_DEFAULTS[:exception_handling][:to_email].present?
    end

    def email_subject
      [
        'EXCEPTION CAUGHT',
        Rails.application
             .config
             .session_options[:key]
             .sub(/^_/, '')
             .sub(/_session/, '')
             .humanize
             .titleize
      ].join(' ')
    end

    def log_file_path
      File.join(Rails.root, 'log', "#{log_file}.log")
    end

    def custom_logger
      @custom_logger ||= ActiveSupport::Logger.new(log_file_path, 0, 500)
    end
  end
end
