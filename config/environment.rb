# Load the rails application
require File.expand_path('../application', __FILE__)

require Rails.root + 'lib/const.rb'

# Initialize the rails application
Ocm::Application.initialize!
