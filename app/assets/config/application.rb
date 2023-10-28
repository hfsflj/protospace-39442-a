module YourAppName
module Myapp
  class Application < Rails::Application
    # 他の設定を追加
    config.action_controller.permit_all_parameters = true
    require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

config.load_defaults 6.0
  end
end
