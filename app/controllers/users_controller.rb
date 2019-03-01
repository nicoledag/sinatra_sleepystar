class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/planners'
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do
    # PREVENT SOMEONE SIGNING UP TWICE WITH THE SAME USERNAME.
    user = User.find_by(:email => params[:email])

    if user != nil
      redirect '/login'
    elsif
      user == nil && params[:username] != "" && params[:email] != "" && params[:password] != ""
      new_user = User.create(params)
		  session[:user_id] = new_user.id

      redirect '/planners'
	  else
		  redirect '/signup'
		end
  end

  get '/login' do
    if logged_in?
      redirect '/planners'
    else
      erb :"users/login"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password]) && user.username != ""
      session[:user_id] = user.id

      redirect "planners"
    else
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect '/login'
    else
      redirect '/'
    end
  end


end
