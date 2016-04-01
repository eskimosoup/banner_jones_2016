source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'shoulda-matchers', '~> 2.8.0'
end

group :test do
  gem 'database_cleaner', '~> 1.5.0'
  gem 'capybara', '~> 2.5.0'
  gem 'launchy', '~> 2.4.3'
  gem 'selenium-webdriver'
  gem 'simplecov', require: false
  gem 'shoulda-callback-matchers', '~> 1.1.1'
end

group :development do
  gem 'quiet_assets', '~> 1.1.0'
  gem 'guard-rspec', '~> 4.6.4', require: false
  gem 'optimadmin_generators', git: 'git@github.com:eskimosoup/optimadmin_generators.git'
  gem 'rack-mini-profiler', '~> 0.9.7'
  gem 'flamegraph', '~> 0.1.0'
  gem 'stackprof', '~> 0.2.7'
  gem 'bullet', '~> 4.14.7'
end

gem 'optimadmin', git: 'git@github.com:eskimosoup/Optimadmin.git', branch: 'master'
# gem 'optimised_site', git: 'git@github.com:eskimosoup/optimised_site.git', branch: 'master'
gem 'optimised_site', path: '../optimised_site'
gem 'friendly_id', '~> 5.1.0'
gem 'therubyracer', platforms: :ruby
