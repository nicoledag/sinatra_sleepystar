class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/planners'
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do
    binding.pry
    #prevents some from signing up twice with the same username.
    user = User.find_by(:email => params[:email])

    if user != nil
      flash[:error] = "The user already exists."
      redirect '/login'
    elsif
      user == nil && params[:username] != "" && params[:email] != "" && params[:password] != ""
      new_user = User.create(params)
		  session[:user_id] = new_user.id

      flash[:warning] = "You have successfully signed up."
      redirect '/planners'
	  else
      flash[:error] = "You did not enter all criteria to sign up."
		  redirect '/signup'
		end
  end

  get '/login' do
    if logged_in?
      # flash[:error] = "You have successfully logged in."
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
