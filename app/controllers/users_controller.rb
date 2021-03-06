class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/babies'
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do
    #prevents some from signing up twice with the same username.
    user = User.find_by(:username => params[:username])

    if user != nil
      flash[:message] = "The user entered already exists.  Please try logging in"
      redirect '/login'
    elsif
      user == nil && params[:username] != "" && params[:email] != "" && params[:password] != ""
      new_user = User.create(params)
		  session[:user_id] = new_user.id

      flash[:message] = "You have successfully signed up."
      redirect '/babies'
	  else
      flash[:message] = "You did not enter all the criteria needed to sign up."
		  redirect '/signup'
		end
  end

  get '/login' do
    if logged_in?
      redirect '/babies'
    else
      erb :"users/login"
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

    if user && user.authenticate(params[:password]) && user.username != ""
      session[:user_id] = user.id

      redirect "babies"
    else
      redirect '/login'
    end
  end

  get '/logout' do
    redirect_if_not_logged_in
      session.clear
      flash[:message] = "You have successfully logged out"
      redirect '/'
  end


end
