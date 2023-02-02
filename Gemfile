source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '~> 2.7.6'

gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jbuilder"
gem "bootsnap", require: false
gem 'faraday', '~> 2.3'

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'ffaker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0.0'
end

group :test do
  gem 'shoulda-matchers', '~> 5.0'
  # gem "capybara"
  # gem "selenium-webdriver"
  # gem "webdrivers"
end
