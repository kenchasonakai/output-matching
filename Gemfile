source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '~> 6.0'
gem 'puma'
gem 'sass-rails'
gem 'webpacker'
gem 'turbolinks'
gem 'jbuilder'
gem 'bootsnap',   '1.4.5', require: false
gem 'sorcery'
gem 'rails-i18n'
gem 'railties', '~> 6.0'

group :development, :test do
  gem 'sqlite3', '1.4.2'
  gem 'byebug',  '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
	gem 'rubocop', require: false
  gem 'rubocop-performance', require: false
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :production do
  gem 'pg'
end
