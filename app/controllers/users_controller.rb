class UsersController < ApplicationController

  get '/login' do

    erb :"users/login"
  end

  post '/login' do
    binding.pry
  end

  get '/signup' do

  end
end
