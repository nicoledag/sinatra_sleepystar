class UsersController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect '/planners'
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do

    # HOW DO YOU PREVENT SOMEONE SIGNING UP TWICE WITH THE SAME USERNAME
    if params[:username] != "" && params[:password] != ""
      @user = User.create(params)
		  session[:user_id] = @user.id
      binding.pry

      redirect '/planners'
		else
		  redirect '/signup'
		 end
  end


  get '/login' do

    erb :"users/login"
  end

  post '/login' do
    user = User.find_by(:username => params[:username])

     if user && user.authenticate(params[:password]) && user.username != ""
       session[:user_id] = user.id

        redirect "/users/#{user.id}"
    else
       erb :"users/error"
    end
  end

  get '/users/:id' do
    "this will be the users show route"
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
