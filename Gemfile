source 'https://rubygems.org'
ruby '2.2.4'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap-sass', '~> 3.3.7'
gem 'coffee-rails', '~> 4.2'
gem 'decent_decoration', '~> 0.1.0'
gem 'decent_exposure', '3.0.0'
gem 'devise'
gem 'draper'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'omniauth-facebook'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'redis', '~> 3.3'
gem 'sass-rails', '~> 5.0'
gem 'slim'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'sqlite3'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'better_errors'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'slim-rails'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
