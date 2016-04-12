require 'faraday'

module Yandex
  module Direct
    def self.parse(hash, key, klass)
      hash.fetch(key,[]).map{|attributes| klass.new(attributes)}
    end

    def self.request(method, path, params = nil)
      puts params.inspect
      response = self.client.post(path, {
          'method' => method,
          'params' => params
      }.to_json, {
          'Authorization' => "Bearer #{configuration['token']}",
          'Client-Login' => configuration['login'],
          'Accept-Language' => configuration['locale'],
          'Content-Type' => 'application/json; charset=utf-8'
      })

      raise "Yandex.Direct response with status #{response.status}" unless response.success?

      response = JSON.parse(response.body)

      if (error = response['error'])
        raise Yandex::Direct::Error.new(error['request_id'], error['error_code'], error['error_string'], error['error_detail'])
      end

      response['result']
    end
  end
end
