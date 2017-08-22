source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'simple_form'
gem 'shrine'
gem 'autonumeric-rails'
gem 'devise'
gem 'omniauth-facebook'
gem 'rolify'
gem 'cancancan'
gem 'devise_token_auth'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'faker'
  gem 'rails-controller-testing'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end
