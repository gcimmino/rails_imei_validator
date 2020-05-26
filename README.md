![Ruby](https://github.com/gcimmino/rails_imei_validator/workflows/Ruby/badge.svg?branch=master)
# RailsImeiValidator

Imei (International Mobile Equipment Identity) is based on Luhn algorithm. This gem is a simple active model validator for imei.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_imei_validator'
```

And then execute:

    $ bundle

## Usage

```ruby
class MyModel
  validates :imei_code, imei: true
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Run tests

    $ rake test

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gcimmino/rails_imei_validator.
