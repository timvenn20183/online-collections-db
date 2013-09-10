require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Ocd
  class Application < Rails::Application

    config.single_mode = false
    config.domain = "test.co.za"
    config.support_email = "tim@nevyn.co.za"
    config.protocol = "http"
    config.password_retries = 3

    require 'signupvalidations'
    require 'functs'

    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
        address:              'smtp.mweb.co.za',
        port:                 25,
        domain:               'onlinecollector.co.za',
    }


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    config.time_zone = "Pretoria"

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
  end
end
