source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', '7.0.4.3'

gem 'bootsnap'
gem 'bootstrap-sass'
gem 'devise'
gem 'haml-rails'
gem 'importmap-rails'
gem 'pg'
gem 'puma'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'will_paginate'
gem 'will_paginate-bootstrap-style'

group :development, :test do
  gem 'debug', '1.7.1', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 4.11'
  gem 'faker'
  gem 'haml_lint', require: false
  gem 'rspec-rails'
  gem 'sgcop', github: 'SonicGarden/sgcop'
end

group :development do
  gem 'gimei'
  gem 'rails-i18n'
  gem 'solargraph', '0.48.0'
  gem 'web-console', '4.2.0'
end

group :test do
  gem 'capybara',                 '3.38.0'
  gem 'guard',                    '2.18.0'

  gem 'capybara-screenshot'
  gem 'rails-controller-testing', '1.0.5'
  gem 'selenium-webdriver',       '4.8.3'
  gem 'simplecov', require: false
  gem 'simplecov-lcov'
  gem 'undercover'
  gem 'undercover-checkstyle'
  gem 'webdrivers', '5.2.0'
end

# Windows ではタイムゾーン情報用の tzinfo-data gem を含める必要があります
# gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
