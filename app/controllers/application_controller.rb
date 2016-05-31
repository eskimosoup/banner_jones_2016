class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :load_global_objects, :set_seo_variables

  include Optimadmin::AdminSessionsHelper

  helper_method :current_administrator

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: -> { render_error(500) }
    rescue_from ActiveRecord::RecordNotFound, with: -> { render_error(404) }
    rescue_from ActionController::RoutingError, with: -> { render_error(404) }
  end

  def sitemap
    @seo_entries = SeoEntry.where(in_sitemap: true).order(:nominal_url)

    respond_to do |format|
      format.html
      format.xml
    end
  end

  private

  def set_seo_variables
    seo_entry = SeoEntry.find_by_nominal_url(request.path)
    return unless seo_entry
    @title = seo_entry.title
    @meta_description = seo_entry.meta_description
    @meta_tags = seo_entry.title
  end

  def load_global_objects
    @header_aside_menu = Optimadmin::Menu.new(name: 'header_aside')
    @primary_header_menu = Optimadmin::Menu.new(name: 'primary_header')
    @footer_menu = Optimadmin::Menu.new(name: 'footer')
    @awards = Award.displayed
    @callback_request = CallbackRequest.new
    @contact = Contact.new
    @navigation_offices = Office.displayed
  end

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings

  def render_error(status)
    respond_to do |format|
      format.html { render "errors/#{status}", status: status }
      format.all { render nothing: true, status: status }
    end
  end
end
