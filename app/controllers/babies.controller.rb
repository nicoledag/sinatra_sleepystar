class BabiesController < ApplicationController

  #index route for all baby entries.
  get '/babies' do
    if logged_in?
      @babies = Baby.all
      erb :'babies/babies'
    else
     redirect '/login'
    end
  end

  # get babies/new to render a form to create a new entry.
  get '/babies/new' do
    if logged_in?
     erb :'/babies/new'
    else
     redirect '/login'
   end
  end

  #post babies to create a new baby entry.
  post '/babies' do
    
  end


  #show route for a baby entry.

  #get babies/:id/edit to render form to edit a baby.

  #patch babies to update a baby.

  #delete babies to delete a baby.


end
