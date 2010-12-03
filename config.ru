# This file is used by Rack-based servers to start the application.
# works with heroku

require "config/environment"

use Rails::Rack::LogTailer
use Rails::Rack::Static
run ActionController::Dispatcher.new