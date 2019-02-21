require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"  #creates session ID for particular session.  Extra layer of security.

  end

  get "/" do
    erb :welcome
  end

end
