$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')

require 'simple_config/railtie' if defined?(Rails)
