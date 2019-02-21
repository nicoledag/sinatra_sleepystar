class UsersController < ApplicationController

  get '/login' do

    erb :"users/login"
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user_id #logging user in
      puts session
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
