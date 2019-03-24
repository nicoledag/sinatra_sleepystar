require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "baby_sleep_planner"  #creates session ID for particular session.  Extra layer of security.
  end

  get "/" do
    erb :welcome
  end

  get '/recommended_chart' do
    erb :estimated_sleep
  end

  helpers do
    def logged_in?
      !!current_user
      # A "double-bang operator" (!!) will return true or false based on whether a value is truthy or falsey to begin with.
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
      #reduce a few database calls.  memorization
      #create instance variable @current_user within scope of application controller.
      #the first time current_user is referenced and user is found.
      #subsequent call if already populated won't hit database again
    end

    def redirect_if_not_logged_in
      if !logged_in?
        redirect '/login'
      end
    end

  end


end
