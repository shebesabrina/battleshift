source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'active_model_serializers', '0.10'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'email_spec'
  gem 'simplecov', require: false
end

group :test do
  gem 'simplecov'
  gem 'shoulda-matchers'
  gem "capybara", "~> 3.3"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Added at 2018-07-09 14:57:07 -0600 by sabrinarobinson:
gem "bcrypt", "~> 3.1"

# Added at 2018-07-09 15:00:06 -0600 by sabrinarobinson:
gem "pry", "~> 0.11.3"

# Added at 2018-07-09 15:43:57 -0600 by sabrinarobinson:
gem "capybara", "~> 3.3"

# Added at 2018-07-10 14:13:11 -0600 by zacharythomas:
gem "figaro", "~> 1.1"
