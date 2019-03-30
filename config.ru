require './config/environment'
# require './application_controller'

# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
# end

use Rack::MethodOverride

use UsersController
use BabiesController
use PlannersController

run ApplicationController
# run Sinatra::Application
