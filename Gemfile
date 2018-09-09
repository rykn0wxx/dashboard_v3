source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
gem 'turbolinks', '~> 5'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw, :ruby]
end

group :development do
	gem 'sqlite3'
	gem 'annotate'
  gem 'web-console', '>= 3.3.0'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby, :ruby]
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'material_icons', '~> 2.2', '>= 2.2.1'

gem 'materialize-sass', '~> 1.0.0.rc2'

gem 'smarter_csv'
gem 'parallel'

gem 'simple_form', '~> 4.0', '>= 4.0.1'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?

gem 'devise'

gem 'administrate'
gem 'activerecord-import', github: 'jkowens/activerecord-import', branch: 'sqlite_upsert'
