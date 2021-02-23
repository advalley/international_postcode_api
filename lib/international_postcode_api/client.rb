require 'net/https'
require 'json'

module InternationalPostcodeApi
  class Client
    def self.autocomplete(term, context = 'nld')
      uri = generate_uri(:autocomplete, context, term)
      fetch(uri)
    end

    def self.details(context)
      uri = generate_uri(:address, context)
      fetch(uri)
    end

    def self.supported_countries
      uri = generate_uri('supported-countries')
      fetch(uri)
    end

    private

    def self.generate_uri(*path)
      encoded_uri = URI.encode(InternationalPostcodeApi.configuration.base_uri + path.join('/'))
      URI.parse encoded_uri
    end

    def self.fetch(uri)
      config = InternationalPostcodeApi.configuration

      req = Net::HTTP::Get.new(uri)
      req['X-Autocomplete-Session'] = config.session_token
      req.basic_auth config.api_key, config.secret_key

      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request req
      end

      JSON.parse(response.body)
    end
  end
end
