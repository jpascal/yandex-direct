require 'faraday'

module Yandex
  module Direct
    URL_API = 'https://api.direct.yandex.com/json/v5'.freeze
    URL_API_SANDBOX = 'https://api-sandbox.direct.yandex.com/json/v5'.freeze
    def self.client
      @client ||= Faraday.new(url: (configuration['sandbox'] ? URL_API_SANDBOX : URL_API)) do |faraday|
        faraday.use Faraday::Adapter::NetHttp
      end
    end
  end
end
