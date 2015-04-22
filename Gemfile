source 'https://rubygems.org'
gem 'rails', '4.2.1'
gem 'sqlite3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass'
gem 'slim-rails'
gem 'interactor-rails', '~> 2.0'
gem 'twitter'
gem 'sidekiq'
gem 'sinatra', require: nil # required by sidekiq/web

group :development do
  gem 'better_errors'
  gem 'foreman'
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :development, :test do
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg'
  gem 'unicorn'
end
