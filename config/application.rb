require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BannerJones2016
  class Application < Rails::Application
    { env: 'development' }
    config.exceptions_app = routes

    config.time_zone = 'London'
    config.active_record.default_timezone = :local

    # Mailer log
    config.action_mailer.logger = ActiveSupport::Logger.new(
      Rails.root.join('log', 'mailer.log')
    )

    config.autoload_paths << "#{Rails.root}/lib"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
