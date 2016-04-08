# Yandex::Direct

Allow you work with any Yandex.Direct API

## Installation

Add this line to your application's Gemfile:

```
gem 'yandex-direct'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yandex-direct

## Configuration

### Ruby:

Create configuration file yandex_direct.yml

    token: token
    login: login
    locale: ru
    verbose: true
    sandbox: true

Load configuration
    
    Yandex::Direct.config "yandex_direct.yml"

### Ruby On Rails:

Create configuration file config/yandex_direct.yml

    development:
        token: token
        login: login
        locale: ru
        verbose: true
        sandbox: true

Create yandex_direct.rb in config/initializers

    Yandex::Direct.config File.join(Rails.root, "config", "yandex_direct.yml"), Rails.env

## Example:

    require 'yandex-direct'
    Yandex::Direct.load "yandex_direct.yml"

    campaign = Yandex::Direct::Campaign.where(Ids: [345545]).limit(1).call(:get).first
    puts campaign.inspect

    campaign = Yandex::Direct::Campaign.get(345545)
    puts campaign.inspect

## Todo list

- write tests
- add others Yandex.Direct model
- add validations
- add relations between models 

## Contributing

1. Fork it ( https://github.com/jpascal/yandex-direct/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
