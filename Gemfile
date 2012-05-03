source 'https://rubygems.org'

gem 'rails', '3.2.3'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'mysql2'
end


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem "twitter-bootstrap-rails"
  gem "therubyracer"
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'pg'
end
gem "github", ">= 0.7.0", :require => nil, :group => [:development]

gem "simple_form"
gem "unicorn"
gem 'foreman', '0.45.0'
gem 'haml-rails'
gem 'jquery-rails'

gem "capybara", :group => [:development, :test]
gem "rspec-rails", :group => [:development, :test]

