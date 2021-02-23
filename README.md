# Ruby wrapper for the postcode.eu endpoints
https://www.postcode.nl/en/services/adresdata/international

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'international_postcode_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install international_postcode_api

## Usage

Create an initializer (config/intializers/international_postcode_api.rb)

```ruby
InternationalPostcodeApi.configure do |config|
  config.api_key      = 'your-API-key'
  config.secret_key   = 'your-secret-key'

  # set new base_uri if new versions are released
  # config.base_uri = 'https://api.postcode.eu/international/v1'

  # Do not switch to Dutch endpoint for Dutch requests will dynamicly switch by default
  # config.dynamic_endpoints = false
end
```

## Methods

All methods can be called from the client object:
```ruby
  InternationalPostcodeApi::Client.autocomplete('Amsterdam', 'NLD')
  required: term
  optional: country_code, default: NLD
```
