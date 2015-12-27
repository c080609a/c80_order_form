[![Gem Version](https://badge.fury.io/rb/c80_order_form.svg)](http://badge.fury.io/rb/c80_order_form)
[![Build Status](https://travis-ci.org/c080609a/c80_order_form.svg?branch=master)](https://travis-ci.org/c080609a/c80_order_form)

# C80OrderForm

This gem allows to users to send order messages from site.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'c80_order_form'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install c80_order_form

## Usage

NOTE: This gem uses `activeadmin` gem, `jQuery` gem, `bootstrap-sass` gem and `c80_modal_forms` gem.

Ensure, that your application's `Gemfile` contains these lines:
```ruby
# active admin
gem 'activeadmin'
gem 'devise'
gem 'cancan' # or cancancan
gem 'draper'
gem 'pundit'

gem 'jquery-rails'
gem 'bootstrap-sass'
gem 'c80_modal_forms'
```

You will need to add these lines into your `application.js`:

    //= require bootstrap/modal
    //= require c80_modals_form
    //= require c80_order_form

And add this line into `application.scss`:

    @import "bootstrap-sprockets";
    @import "bootstrap";
    @import "c80_order_form";

Add this line into `active_admin.scss`:

    @import "c80_order_form_active_admin";

Add this line into `routes.rb`:

    mount C80OrderForm::Engine => '/'

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/c80_order_form/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
