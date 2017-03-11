## Yelp Clone
#### Technologies: Ruby, Rails, Rspec, PostgreSQL, HTML
### Week 8 pair programming challenge for [Makers Academy] (http://www.makersacademy.com)
[Outline](#outline) | [User Stories](#user-stories) | [Gems](#gems) | [Usage Instructions](#usage-instructions) 

## Brief
This week's project is a clone of Yelp. The goal is to introduce you to Rails, focusing especially on:

  * Creating Rails applications
  * The structure of Rails apps (MVC, the router, helpers)
  * TDD in Rails, with RSpec & Capybara
  * Associations
  * Validations
  * AJAX in Rails

## Outline

## User Stories
```
```

## Gems
```ruby
gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'shoulda', '~> 3.5'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'omniauth-facebook'
gem 'paperclip', '~> 4.3', '>= 4.3.6'
gem 'aws-sdk', '~> 2.3'


group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'rspec-collection_matchers'
  gem 'poltergeist'
  gem 'database_cleaner'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

## Usage Instructions
* clone the repo and run bundle
```shell
$ git clone https://github.com/samjones1001/makersbnb
$ cd makersbnb
$ rvm 2.3.3
$ bundle
```
* run tests
```shell
$ rspec
```
* start up sinatra
```shell
$ ruby app.rb
```
* in your browser, navigate to http://localhost:4567/ 

