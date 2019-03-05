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
      @babies = Baby.all
     erb :'/planners/new'
    else
     redirect '/login'
   end
  end

  #post planners to create a new planner entry.

  post '/planners' do
    if logged_in?
      if params[:baby][:name] == ""
        baby = Baby.find(params[:baby][:babys_id])

        params[:baby][:planners].each do |p|
          @planner = Planner.new(p)
          @planner.baby = baby
          @planner.save
          redirect "/planners/#{@planner.id}"
          end

     else params[:baby][:name] != ""
        baby = Baby.new(name: params[:baby][:name])
        baby.save

        params[:baby][:planners].each do |p|
          @planner = Planner.new(p)
          @planner.baby = baby
          @planner.save
          redirect "/planners/#{@planner.id}"
          end
        end
    else
      redirect '/login'
    end
  end


  #show route for a planner entry.
  get '/planners/:id' do
    if logged_in?
      @planner = Planner.find_by(id: params[:id])
      erb :'/planners/show_planner'
    else
      redirect '/login'
    end
  end


  #get planners/:id/edit to render form to edit a planner.

  #patch planners to update a planner.

  #delete planners to delete a planner.

end
