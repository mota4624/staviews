require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Staviews
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.active_storage.variant_processor = :mini_magick

    # ActiveStorage上書きしない
    config.active_storage.replace_on_assign_to_many = false

    #     config.i18n.default_locale = :ja # 投稿時刻を日本時間にする場合
    #     config.time_zone = 'Tokyo' # 投稿時刻を日本時間にする場合

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
