require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "the_best_sleep_planner"  #creates session ID for particular session.  Extra layer of security.

  end

  get "/" do
    erb :welcome
  end

end
