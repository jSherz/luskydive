require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Luskydive
  # Main application config, shared across all environments
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'London'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    Koala.config.api_version = 'v2.0'

    config.action_controller.perform_caching = true

    # Facebook ID & graph access token for events lookup
    config.facebook_group_id = '18228677368'
    config.facebook_access_token = Figaro.env.facebook_access_token

    config.facebook_app_id = '555160587939138'

    config.facebook_group_url = 'https://www.facebook.com/groups/shockabrah'
    config.facebook_page_url = 'https://www.facebook.com/leedsuniskydivers'
    config.twitter_url = 'https://twitter.com/LeedsSkyDivers'
    config.club_email = 'leedsskydivers@gmail.com'

    # Check for required ENV vars
    Figaro.require_keys 'facebook_access_token', 'facebook_app_secret', 'secret_key_base',
                        'database_host', 'database_user', 'database_pass', 'database_name',
                        'smtp_port', 'smtp_server', 'smtp_login', 'smtp_password',
                        'devise_secret_key', 'devise_pepper'
  end
end
