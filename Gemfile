source 'https://rubygems.org'

# Core
gem 'rails', '4.2.4'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# App server
gem 'unicorn'

# Database
gem 'mysql2', '~> 0.3.18'

# Environment config
gem 'figaro', github: 'laserlemon/figaro'

# Views
gem 'haml', '~>4.0.5'

# Assets
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'bourbon'
gem 'bitters'
gem 'neat'

# Deployment
group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # Live refresh
  gem 'guard-livereload', require: false
  gem 'guard-rubocop'

  # Code inspection & linting
  gem 'rubocop'
end

# Koala Facebook API
gem 'koala', '~> 1.10.0rc'

# Admin
gem 'rails_admin'
gem 'devise'
gem 'paper_trail', '~> 3.0.5'
gem 'cancan'

# File uploads
gem 'carrierwave'
