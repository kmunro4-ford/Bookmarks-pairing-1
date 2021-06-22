require 'capybara/rspec'

ENV['RACK_ENV'] = 'test'

# require File.join(File.dirname(__FILE__), '/features/web_helpers.rb')
require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BookmarkManager
