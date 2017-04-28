[![Gem Version](https://badge.fury.io/rb/c80_order_form.svg)](http://badge.fury.io/rb/c80_order_form)
[![Build Status](https://travis-ci.org/c080609a/c80_order_form.svg?branch=master)](https://travis-ci.org/c080609a/c80_order_form)

# C80OrderForm

This gem allows to users to send order messages from site.

# Features

* Сообщения сохраняются в базу, их можно просмотреть через админку, они уходят на почту 
("хардкод", зависимость от окружения: `SiteProp.first.mail_from` и `SiteProp.first.mail_to`,
см. `c80_order_form/app/mailers/c80_order_form/message_order_mailer.rb`).
* Форма защищена от спама без каких либо капч - она приходит с сервера в виде html-строки при клике по кнопке 
и вставляется на страницу с помощью js.
* Можно вводить как *правильный* номер телефона (в каком угодно формате), так и *корректный* 
email в одно единственное поле.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'c80_order_form'
```

Migrate:

    
## Setup

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
    //= require bootstrap/transitions
    //= require c80_modal_forms
    //= require c80_order_form

And add this line into `application.scss`:

    @import "bootstrap-sprockets";
    @import "bootstrap";
    @import "c80_order_form";

Add this line into `active_admin.scss`:

    @import "c80_order_form_active_admin";

Add this line into `routes.rb`:

    mount C80OrderForm::Engine => '/'

Wget `custom_seed.rake` to `lib/tasks`:

    $ cd lib/tasks
    $ wget https://gist.githubusercontent.com/c80609a/ce9058d176c793877562411439b27a17/raw/288d7c57c25debc972541633077a99177c2b689c/custom_seed.rake

Create and execute the seed `db/seeds`:

```
# rake db:seed:103_fill_order_form_settings

C80OrderForm::Settings.delete_all
C80OrderForm::Settings.create!({
                                   :order_form_title => "Заявка на бронирование",
                                   :order_form_label_name => "Имя",
                                   :order_form_label_email_or_phone => "Email или телефон",
                                   :order_form_label_comment => "Комментарий",
                                   :order_form_label_button_send => "Отправить",
                                   :order_form_label_button_sending => "Отправляется...",
                                   :ok_text => "Мы свяжемся с Вами в ближайшее время",
                                   :ok_text_title => "Ваша заявка отправлена",
                                   :admin_label_menu => "Заявки на бронирование",
                                   :message_letter_subj => "Заявка на бронирование",
                                   :message_text => " • Имя: {name}<br>" +
                                       " • Email или телефон: {email_or_phone}<br>" +
                                       " • Сообщение: {comment}<br>" +
                                       " --------------------------------------<br>" +
                                       " Бронируемая площадь: <a href='http://xxx.ru/areas/{subj_id}'>http://xxx.ru/areas/{subj_id}</a><br>" +
                                       " Бронируемая площадь в админке: <a href='http://xxx.ru/admin/areas/{subj_id}/edit'>http://xxx.ru/admin/areas/{subj_id}</a><br>"
                               })
```

Или такой файл (если подразумевается абстрактное сообщение с сайта, не свяазанное ни с каким объектом):

```
# rake db:seed:103_fill_order_form_settings

C80OrderForm::Settings.delete_all
C80OrderForm::Settings.create!({
                                   :order_form_title => 'Заявка на бронирование',
                                   :order_form_label_name => 'Имя',
                                   :order_form_label_email_or_phone => 'Email или телефон',
                                   :order_form_label_comment => 'Комментарий',
                                   :order_form_label_button_send => 'Отправить',
                                   :order_form_label_button_sending => 'Отправляется...',
                                   :ok_text => 'Мы свяжемся с Вами в ближайшее время',
                                   :ok_text_title => 'Ваша заявка отправлена',
                                   :admin_label_menu => 'Заявки на бронирование',
                                   :message_letter_subj => 'Заявка на бронирование',
                                   :message_text => ' • Имя: {name}<br>' +
                                       ' • Email или телефон: {email_or_phone}<br>' +
                                       ' • Сообщение: {comment}'
                               })
```

## Usage

Form invoked by link with class `c80_order_invoking_btn`:

```slim
        = link_to "Book it",
                  "#",
                  :title => "Book it",
                  :class => "c80_order_invoking_btn",
                  :data => { :comment_text => "Hello, I want book the room '#{@area.title}'.", 
                             :subj_id => @area.id 
                  }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/c080609a/c80_order_form/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
