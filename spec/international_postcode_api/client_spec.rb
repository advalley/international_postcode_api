require 'spec_helper'

RSpec.describe InternationalPostcodeApi::Client do
  before :all do
    InternationalPostcodeApi.configure do |config|
      config.api_key      = 'mock-api-key'
      config.secret_key   = 'mock-api-secret'
    end
  end

  describe '#autocomplete' do
    it 'Should return matching response when formatted correctly' do
      stub_request(:get, 'https://api.postcode.eu/international/v1/autocomplete/nld/Vlaamsegaai').
        to_return(status: 200, body: File.read('spec/fixtures/autocomplete.txt'))

      response = InternationalPostcodeApi::Client.autocomplete('Vlaamsegaai')
      expect(response['exception']).to eq(nil)
    end
  end

  describe '#details' do
    it 'Should return address details' do
      stub_request(:get, "https://api.postcode.eu/international/v1/address/nld4Ixme2mExtLJrEKNiUBpaWlNHYln1ztNGsOVItBZ46IFMiOjg0sZ4YpoyEbSnipOx0bd49up2ixccmi8CkTmvDRGKvKzYSyVAxBDcWyfNMNXZDtdAzxXQpWdZUWBRMor99WWm9PufM").
         to_return(status: 200, body: File.read('spec/fixtures/details.txt'))

      response = InternationalPostcodeApi::Client.details('nld4Ixme2mExtLJrEKNiUBpaWlNHYln1ztNGsOVItBZ46IFMiOjg0sZ4YpoyEbSnipOx0bd49up2ixccmi8CkTmvDRGKvKzYSyVAxBDcWyfNMNXZDtdAzxXQpWdZUWBRMor99WWm9PufM')
      expect(response['exception']).to eq(nil)
    end

    it 'Should return an exception value when invalid' do
      stub_request(:get, "https://api.postcode.eu/international/v1/address/").
        to_return(status: 200, body: File.read('spec/fixtures/details_invalid.txt'))

      response = InternationalPostcodeApi::Client.details('')
      expect(response['exception']).to eq('Text is too short, minimum length is 1.')
    end
  end

  describe '#postcode' do
    it 'Should return the address for the dutch API' do
      stub_request(:get, "https://api.postcode.eu/nl/v1/addresses/postcode/1000AB/50/").
        to_return(status: 200, body: File.read('spec/fixtures/postcode_nl.txt'))

      response = InternationalPostcodeApi::Client.postcode('1000AB', '50')

      expect(response.dig(:city)).to_not eq(nil)
      expect(response.dig(:street)).to_not eq(nil)
    end

    it 'Should return the address for the international API' do
      stub_request(:get, 'https://api.postcode.eu/international/v1/autocomplete/deu/1000AB%2050').
        to_return(status: 200, body: File.read('spec/fixtures/postcode_int.txt'))
      stub_request(:get, "https://api.postcode.eu/international/v1/address/nld4Ixme2mExtLJrEKNiUBpaWlNHYln1ztNGsOVItBZ46IFMiOjg0sZ4YpoyEbSnipOx0bd49up2ixccmi8CkTmvDRGKvKzYSyVAxBDcWyfNMNXZDtdAzxXQpWdZUWBRMor99WWm9PufM").
         to_return(status: 200, body: File.read('spec/fixtures/details.txt'), headers: {})

      response = InternationalPostcodeApi::Client.postcode('1000AB', '50', 'DEU')

      expect(response.dig(:city)).to_not eq(nil)
      expect(response.dig(:street)).to_not eq(nil)
    end
  end

  describe '#supported-countries' do
    it 'should return a list of supported countries' do
      stub_request(:get, 'https://api.postcode.eu/international/v1/supported-countries').
         to_return(status: 200, body: File.read('spec/fixtures/supported_countries.txt'))

      response = InternationalPostcodeApi::Client.supported_countries
      expect(response.is_a?(Array)).to eq(true)
    end
  end

  describe '#dutch_postcode' do
    it 'should return the dutch result for postcodes' do
      stub_request(:get, 'https://api.postcode.eu/nl/v1/addresses/postcode/1000AB/50/').
         to_return(status: 200, body: File.read('spec/fixtures/dutch_postcode.txt'))

      response = InternationalPostcodeApi::Client.dutch_postcode('1000AB', '50')
    end
  end
end
