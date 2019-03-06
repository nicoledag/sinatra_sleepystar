class PlannersController < ApplicationController

#index route for all planner entries.
  get '/planners' do
    if logged_in?
      @planners = current_user.planners
      erb :'planners/planners'
    else
     redirect '/login'
    end
  end

  # get planners/new to render a form to create a new entry.
  get '/planners/new' do
    if logged_in?
      @babies = current_user.babies
     erb :'/planners/new'
    else
     redirect '/login'
   end
  end

  #post planners to create a new planner entry.

  post '/planners' do
    if logged_in?

       #WHAT IF A USER ENTERS A NEW BABY NAME AND SELECTS EXISTING NAME?
      if params[:baby][:name] == ""
        baby = Baby.find(params[:baby][:babys_id])

        params[:baby][:planners].each do |p|
          @planner = Planner.new(p)
          @planner.baby = baby
          @planner.save
          redirect "/planners/#{@planner.id}"
          end

     else params[:baby][:name] != ""
        baby = current_user.babies.build(name: params[:baby][:name])
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

  get '/planners/:id/edit' do

   if logged_in?
     @planner = Planner.find_by(id: params[:id])
     @babies = current_user.babies
     if @planner.baby.user == current_user
       erb :'/planners/edit'
     else
       redirect '/planners'
     end
   else redirect '/login'
   end
 end

  #patch planners to update a planner.
  patch '/planners/:id' do
  "please work"
  end

  #delete planners to delete a planner.

end
