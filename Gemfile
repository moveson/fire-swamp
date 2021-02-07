source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "auto-session-timeout"
gem "bootsnap", ">= 1.4.4", require: false
gem "bootstrap", "~> 5.0.0.beta1"
gem "devise"
gem "devise-bootstrap-views"
gem "font_awesome5_rails"
gem "image_processing", "~> 1.2"
gem "local_time"
gem "pg"
gem "puma", "~> 5.0"
gem "pundit"
gem "rails", "~> 6.1.1"
gem "redis", "~> 4.0"
gem "sass-rails", ">= 6"
gem "stimulus-rails"
gem "turbo-rails"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 4.0.2"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
end

group :development do
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  # Access an interactive console on exception pages or by calling "console" anywhere in the code.
  gem "web-console", ">= 4.1.0"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem "capybara", ">= 3.26"
  gem "factory_bot_rails"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
  # Easy installation and use of web drivers to run system tests with browsers
  gem "webdrivers"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
