source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
end
group :test do
  gem 'sqlite3'
end
group :production do
  gem 'pg'
end

# therubyracer provices a JavaScript container
#    this is not needed for Windows
# under Windows, run 
#     bundle install --without not_windows
# under Ubuntu, run
#     bundle install
group :not_windows do
	gem 'therubyracer'
end

gem 'execjs'

gem 'sorcery'
gem 'acts-as-taggable-on'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end
