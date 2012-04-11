require 'fileutils'

namespace :simple_config do
  include FileUtils

  desc 'Bootstrap simpleconfig configuration files'
  task :setup do
    raise "This task should be run from within a Rails application." unless defined?(Rails)
    raise "Already found config/settings, aborting." if File.exist?('config/settings')

    mkdir(Rails.root + 'config/settings')
    mkdir(Rails.root + 'config/initializers') unless File.exist?('config/initializers')

    environments =  Dir['config/environments/*.rb'].map { |f| File.basename(f, '.rb') }
    environments << 'application'
    environments.each { |env| touch("config/settings/#{env}.rb") }

    cp(File.join(File.dirname(__FILE__), *%w[.. .. templates configuration.rb]), 
        'config/initializers/configuration.rb')
  end  

end