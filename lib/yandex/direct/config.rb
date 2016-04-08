require 'yaml'

module Yandex
  module Direct
    def self.configuration
      if defined? @environment
        raise "not configured Yandex.Direct for #{@environment} enviroment" unless @configuration
      else
        raise 'not configured Yandex.Direct' unless @configuration
      end
      @configuration
    end
    def self.config(file, env = nil)
      @environment = env.to_s if env
      config = YAML.load_file(file)
      @configuration = defined?(@environment) ? config[@environment] : config
      @configuration['sandbox'] ||= false
      @configuration
    end
  end
end
