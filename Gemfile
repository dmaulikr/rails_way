source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'

gem 'puma'
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'touchpunch-rails', github: 'geothird/touchpunch-rails'

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'spring'
end
