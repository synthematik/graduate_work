require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module DiplomMehmat
  class Application < Rails::Application
    config.load_defaults 7.2
    config.autoload_lib(ignore: %w[assets tasks])
    config.exceptions_app = routes
  end
end
