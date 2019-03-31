require './config/environment'
# require './application_controller'

use Rack::MethodOverride

use UsersController
use BabiesController
use PlannersController

run ApplicationController
# run Sinatra::Application
