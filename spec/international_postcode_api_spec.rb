require 'spec_helper'

RSpec.describe InternationalPostcodeApi do
  it "has a version number" do
    expect(InternationalPostcodeApi::VERSION).not_to be nil
  end

  describe '#configure' do
    before :all do
      InternationalPostcodeApi.configure do |config|
        config.api_key      = 'mock-api-key'
        config.secret_key   = 'mock-secret-key'
      end
    end

    it 'Should yield from the configuration block' do
      expect(InternationalPostcodeApi.configuration.api_key).to eq('mock-api-key')
      expect(InternationalPostcodeApi.configuration.secret_key).to eq('mock-secret-key')
    end

    it 'Should set a default base_uri' do
      expect(InternationalPostcodeApi.configuration.base_uri).to eq('https://api.postcode.eu/international/v1/')
    end

    it 'Should be able to override the default base_uri' do
      InternationalPostcodeApi.configure do |config|
        config.api_key      = 'mock-api-key'
        config.secret_key   = 'mock-secret-key'
        config.base_uri     = 'https://mock-base-uri.com'
      end

      expect(InternationalPostcodeApi.configuration.base_uri).to eq('https://mock-base-uri.com')
    end

    it 'Should set the default dynamic_endpoints to true' do
      expect(InternationalPostcodeApi.configuration.dynamic_endpoints).to eq(true)
    end

    it 'Should be able to override the default base_uri' do
      InternationalPostcodeApi.configure do |config|
        config.api_key            = 'mock-api-key'
        config.secret_key         = 'mock-secret-key'
        config.dynamic_endpoints  = false
      end

      expect(InternationalPostcodeApi.configuration.dynamic_endpoints).to eq(false)
    end
  end
end
