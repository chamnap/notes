This is my rspec-capybara configuration. It includes factory_girl, simplecov, devise, and omniauth. Remove some if you don't need or make some changes if you like.

  1. Install these packages: firefox, qt, webkit, xvfb, libicu48

    $ sudo apt-get install -y firefox libqt4-dev libqtwebkit-dev xvfb libicu48

  2. Add these gem to your Gemfile

    gem 'factory_girl_rails'
    gem 'rspec-rails'
    gem 'simplecov', '~> 0.6.4', require: false
    gem 'capybara'
    gem 'capybara-screenshot'
    gem 'capybara-webkit'
    gem 'headless'

  3. Copy `spec directory` to your rails app.

  4. Check out `spec/support` directory for more details. There are links at the top of the files to read if you want to know more.

  5. Run the tests

    $ `rspec`

    $ `COVERAGE=true rspec`