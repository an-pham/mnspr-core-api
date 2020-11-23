source 'https://rubygems.org'

ruby '2.7.1'

gem 'sinatra'
gem 'thin'
gem 'rerun'
gem 'sinatra-contrib'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec', '3.9.0'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'rubocop'
end
