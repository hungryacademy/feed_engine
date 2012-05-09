source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'twitter-bootstrap-rails'
gem 'kaminari'
gem 'jquery-rails'
gem 'bcrypt-ruby', '~> 3.0.0'

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'slim-rails'
  gem 'slim'
  gem 'uglifier', '>= 1.0.3'
  gem 'less-rails'
end

group :development, :test do
  gem 'growl'
  gem 'sqlite3'
  gem 'fabrication'
  gem 'faker'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'guard-rspec'
  gem 'simplecov', :require => false
  gem 'annotate', :git => 'git://github.com/ctran/annotate_models.git'
  gem 'reek', :git => "git://github.com/mvz/reek.git", :branch => "ripper_ruby_parser-2"
  gem 'cane', :git => "git://github.com/square/cane.git"
end
