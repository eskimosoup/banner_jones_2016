class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :page_load_speed, :global_site_settings, :load_global_objects, :set_seo_variables

  include Optimadmin::AdminSessionsHelper
  include FormCrmSubmission
  include ErrorHandling

  helper_method :current_administrator

=begin
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: ->(e) { render_error(500, e) }
    rescue_from ActiveRecord::RecordNotFound, with: ->(e) { render_error(404, e) }
    rescue_from ActionController::RoutingError, with: ->(e) { render_error(404, e) }
  end
=end

  def sitemap
    @seo_entries = SeoEntry.where(in_sitemap: true).order(:nominal_url)

    respond_to do |format|
      format.html
      format.xml
    end
  end

  private

  def page_load_speed
    @page_load_start = Time.new
  end

  def set_seo_variables
    seo_entry = SeoEntry.find_by(nominal_url: request.path)
    return unless seo_entry
    @rich_snippet = seo_entry.rich_snippet
    @title = seo_entry.title
    @meta_description = seo_entry.meta_description
    @meta_tags = seo_entry.title
  end

  def load_global_objects
    @header_aside_menu = Optimadmin::Menu.new(name: 'header_aside')
    @primary_header_menu = Optimadmin::Menu.new(name: 'primary_header')
    @footer_menu = Optimadmin::Menu.new(name: 'footer')
    @callback_request = CallbackRequest.new
    @contact = Contact.new
    @awards ||= Award.displayed
    @navigation_offices ||= Office.displayed
    @form_audiences = Audience.displayed.map{ |x| [x.title, x.services.displayed.root_services.map { |c| ['- ' * c.depth + c.title , c.title] }] }
  end

  def global_site_settings
    @global_site_settings ||= Optimadmin::SiteSetting.current_environment
  end
  helper_method :global_site_settings

=begin
  def render_error(status, error)
    logger.error "#{error.class}: #{error.message}"
    respond_to do |format|
      format.html { render "errors/#{status}", status: status }
      format.all { head status }
    end
  end
=end

  def friendly_id_redirect(item)
    redirect_to item, status: 301 unless item.friendly_id == params[:id]
  end

  helper_method def tracking_code(layout = 'application')
    @tracking_code ||= SeoTrackingCodeFacade.new(layout)
  end
end
