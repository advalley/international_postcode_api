require "international_postcode_api/version"

module InternationalPostcodeApi
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :api_key, :secret_key, :base_uri

    def initialize
      @base_uri = 'https://api.postcode.eu/international/v1/'
    end
  end
end
