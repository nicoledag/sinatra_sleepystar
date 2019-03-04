class PlannersController < ApplicationController

#index route for all planner entries.
  get '/planners' do
    if logged_in?
      @planners = Planner.all
      erb :'planners/planners'
    else
     redirect '/login'
    end
  end

  # get planners/new to render a form to create a new entry.
  get '/planners/new' do
    if logged_in?
     erb :'/planners/new'
    else
     redirect '/login'
   end
  end

  #post planners to create a new planner entry.

  post '/planners' do


  end


  #show route for a planner entry.



  #get planners/:id/edit to render form to edit a planner.

  #patch planners to update a planner.

  #delete planners to delete a planner.

end
