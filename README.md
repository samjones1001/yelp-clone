## Yelp Clone
#### Technologies: Ruby, Rails, Rspec, Devise, OmniAuth, Capybara, PostgreSQL, HTML
### Week 8 pair programming challenge for [Makers Academy] (http://www.makersacademy.com)
[Outline](#outline) | [Gems](#gems) | [Usage Instructions](#usage-instructions) 

## Brief
This week's project is a clone of Yelp. The goal is to introduce you to Rails, focusing especially on:

  * Creating Rails applications
  * The structure of Rails apps (MVC, the router, helpers)
  * TDD in Rails, with RSpec & Capybara
  * Associations
  * Validations
  * AJAX in Rails

## Outline
This challenge involved using Rails for the first time in order to build a light-weight clone of Yelp.  Having built an MVP allowing users to add and delete retaurants and leave reviews, I continued by adding user authentications using the [Devise](https://github.com/plataformatec/devise) gem and then allowed for login using Facebook credentials using [OmniAuth](https://github.com/plataformatec/devise/wiki/OmniAuth:-Overview)/.


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
$ git clone https://github.com/samjones1001/yelp-clone
$ cd yelp-clone
$ bundle
```
* run tests
```shell
$ rspec
```
* update your Facebook Security Key and AWS details by creating a file called .env in the root and filling in the below details
```
FACEBOOK_APP_SECRET=
S3_BUCKET_NAME=
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
```
* start a Rails serve
```shell
$ bin/rails server
```

In your browser, go to http://localhost:3000

