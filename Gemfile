source 'https://rubygems.org'
ruby '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.2'

gem 'puma'
gem 'sass-rails'
gem 'turbolinks'
gem 'uglifier'
gem 'bootstrap', github: 'twbs/bootstrap-rubygem'
gem 'font-awesome-rails'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'touchpunch-rails', github: 'geothird/touchpunch-rails'

group :development, :test do
  gem 'pry'
  gem 'rspec-rails'
end

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end
