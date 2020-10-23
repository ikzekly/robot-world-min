# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Framework
gem 'rails', '~> 6.0.3', '>= 6.0.3.3'

# Framework extensions
gem 'aasm'

# Paws
gem 'puma', '~> 4.1'

# Databases
gem 'pg'
gem 'redis'

# Background processing
gem 'sidekiq'
gem 'sidekiq-scheduler', '~> 3.0.1'

# Event broadcasting
gem 'wisper'

# HTTP clients
gem 'faraday'

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry', require: false
  gem 'rspec-rails'
  gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', '~> 1', require: false
  gem 'wisper-rspec', require: false
end

group :test do
  gem 'database_cleaner-active_record'
end
