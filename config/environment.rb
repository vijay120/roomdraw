# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Roomdraw::Application.initialize!

RAILS_ENV = 'production'
Rails.logger = Logger.new(STDOUT)
