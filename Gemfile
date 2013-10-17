source 'http://rubygems.org'

gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'pg'


gem 'mysql2',          '0.3.13'
gem 'thinking-sphinx', '3.0.5'

# therubyracer provices a JavaScript container
#    this is not needed for Windows
# under Windows, run 
#     bundle install --without not_windows
# under Ubuntu, run
#     bundle install
group :not_windows do
   gem 'therubyracer', :require=>'v8', :platforms => :ruby
end

gem 'execjs'

gem 'sorcery'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'haml-rails'
group :development, :test do
  gem "rspec-rails"
  gem "launchy"
  gem "debugger"
 ###########################
 gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
 
  # Pry gems related to debugging. Move this outside the development group
  # in case production debugging is necessary. Note, pry-debugger works
  # in production and conflicts locally with RubyMine, use pry-nav + ~/.pryrc instead.
  # Unfortunately pry-nav does not work in production, so you are left with
  # pry-debugger.
  #
  # Locally where RubyMine exists:
  # group :development, :test do
  #   gem 'pry'
  #   gem 'pry-remote'
  #   gem 'pry-nav'
  # end
  #
  # Production Debugging: See config/environments/production.rb
  # gem 'pry'
  # gem 'pry-remote'
  # gem 'pry-debugger'
 
  #gem 'pry'
  #gem 'pry-remote'
  #gem 'pry-nav'
 ###########################
  gem "pry-rescue"
  gem "pry-stack_explorer"
  gem "pry-doc"
#  gem "pry-debugger"
  gem "runner"
end

group :test do
  gem "factory_girl_rails", "~> 4.0"
  gem "capybara"
  gem "guard-rspec"

end

group :development do
  gem 'hpricot'
  gem 'ruby_parser'
  gem 'html2haml'
  gem "bullet"

end


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
