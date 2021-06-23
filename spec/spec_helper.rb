require 'capybara/rspec'
require './spec/tidy_up.rb'

ENV['ENVIRONMENT'] = 'test'

# require File.join(File.dirname(__FILE__), '/features/web_helpers.rb')
require File.join(File.dirname(__FILE__), '..', 'app.rb')
Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.before(:each) do
      tidy_up
  end
end
