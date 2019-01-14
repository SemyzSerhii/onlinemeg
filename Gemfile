source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'activeadmin'
gem 'ancestry'
gem 'autocomplete_rails'
gem 'awesome_print'
gem 'bcrypt'
gem 'coffee-rails'
gem 'devise'
gem 'dotenv-rails'
gem 'interactor'
gem 'jbuilder'
gem 'pg'
gem 'pg_search'
gem 'puma'
gem 'rails', '~> 5.1.6', '>= 5.1.6.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks'
gem 'uglifier'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
