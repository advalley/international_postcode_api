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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/international_postcode_api.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
