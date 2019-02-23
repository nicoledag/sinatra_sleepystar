class UsersController < ApplicationController

  get '/home' do

  end

  get '/users' do
    @user = User.all

    erb :"users/index"
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

  get '/signup' do
    erb :"users/create_user"
  end


  post '/users' do
    user = User.new(:username => params[:username], :password => params[:password])
    #only persist a user that has a name and password.
    #check if a user already exists when signing in so user isn't duplicated?
		 if user.save
		     redirect "/login"
		   else
		     erb :"users/failure"
		  end
    end

  get '/users/:id' do
    "this will be the users show route"
  end
end
