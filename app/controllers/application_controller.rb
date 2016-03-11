class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :global_site_settings, :load_global_objects

  include Optimadmin::AdminSessionsHelper

  helper_method :current_administrator

  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, with: -> { render_error(500) }
    rescue_from ActiveRecord::RecordNotFound, with: -> { render_error(404) }
    rescue_from ActionController::RoutingError, with: -> { render_error(404) }
  end

  def index
    @banners = Banner.displayed
    @testimonials = Testimonial.displayed
    @articles = Article.home_page_highlight
    @downloads = Download.displayed
    @team_members = TeamMember.displayed
    @services = Service.displayed.pluck(:title, :id)
    @banner_services = Service.banner_highlight
    @banner_menu = Optimadmin::Menu.new(name: 'home_page_banner')
  end

  private

  def load_global_objects
    @header_aside_menu = Optimadmin::Menu.new(name: 'header_aside')
    @primary_header_menu = Optimadmin::Menu.new(name: 'primary_header')
    @footer_menu = Optimadmin::Menu.new(name: 'footer')
    @awards = Award.displayed
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
