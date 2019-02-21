class UsersController < ApplicationController

  get '/users' do
    @user = User.all

    erb :"users/index"
  end



  get '/login' do

    erb :"users/login"
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user_id #logging user in

      redirect to "/users/#{user.id}"
    else

    end
  end

  get '/signup' do

  end

  get '/users/:id' do
    "this will be the users show route"
  end
end
