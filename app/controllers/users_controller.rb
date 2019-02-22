class UsersController < ApplicationController

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

  end

  get '/users/:id' do
    "this will be the users show route"
  end
end
