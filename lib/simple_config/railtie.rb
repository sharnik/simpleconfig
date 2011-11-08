require 'simple_config'
require 'simple_config/controller_mixin'
require 'rails'

module SimpleConfig
  class Railtie < Rails::Railtie
    railtie_name :simple_config
      rake_tasks do
        load "tasks/simple_config.rake"
      end
  end
end
