require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestEnv
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
		config.load_defaults 6.0
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja # デフォルトのlocaleを日本語(:ja)にする
    config.hosts << "6fd90972bbc84b48bd8ac2d6416a0d49.vfs.cloud9.us-east-2.amazonaws.com"
		config.hosts << "sheltered-thicket-81039.herokuapp.com"
    # 　#　以下の記述を追記する(設定必須)
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
