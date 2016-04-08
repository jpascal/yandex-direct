require 'yandex/direct/version'

module Yandex
  module Direct

    autoload :ActionResult, 'yandex/direct/action_result'
    autoload :SelectionCriteria, 'yandex/direct/selection_criteria'
    autoload :ExceptionNotification, 'yandex/direct/exception_notification'
    autoload :Error, 'yandex/direct/error'
    autoload :Base, 'yandex/direct/base'

    autoload :Model, 'yandex/direct/model'

    def self.configuration
      if defined? @environment
        raise "not configured Yandex.Direct for #{@environment} enviroment" unless @configuration
      else
        raise 'not configured Yandex.Direct' unless @configuration
      end
      @configuration
    end

    def self.load(file, env = nil)
      @environment = env.to_s if env
      config = YAML.load_file(file)
      @configuration = defined?(@environment) ? config[@environment] : config
      @configuration['sandbox'] ||= false
    end

    def self.connection
      @connection ||= Faraday.new(url: (configuration['sandbox'] ? URL_API_SANDBOX : URL_API)) do |faraday|
        faraday.use Faraday::Adapter::NetHttp
      end
    end

  end
end
