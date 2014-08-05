require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Make
  class Application < Rails::Application
    config.assets.initialize_on_precompile = false
    config.nav_lynx.selected_class = 'active'
    config.action_view.raise_on_missing_translations = true
  end
end
