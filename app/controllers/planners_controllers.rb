class PlannersController < ApplicationController


#index route for all planner entries.
  get '/planners' do
    if logged_in?
      @planners = current_user.planners.order(created_at: :desc)
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
       #if baby name field is empty and existing baby is selecting find existing baby, create planner and associate with baby.
      if params[:baby][:name] == "" && params[:baby][:babys_id] != nil
        baby = Baby.find(params[:baby][:babys_id])

        @planner = baby.planners.build(wake_time: params[:planners][:wake_time], bed_time: params[:planners][:bed_time],
        notes: params[:planners][:notes], morning_nap_start_time: params[:planners][:morning_nap_start_time],
        morning_nap_end_time: params[:planners][:morning_nap_end_time], morning_nap_total_time: params[:planners][:morning_nap_total_time], midday_nap_start_time: params[:planners][:midday_nap_start_time],
        midday_nap_end_time: params[:planners][:midday_nap_end_time], midday_nap_total_time: params[:planners][:midday_nap_total_time], late_afternoon_nap_start_time: params[:planners][:late_afternoon_nap_start_time],
        late_afternoon_nap_end_time: params[:planners][:late_afternoon_nap_end_time], late_afternoon_nap_total_time: params[:planners][:late_afternoon_nap_total_time], total_nap_time: params[:planners][:total_nap_time])
        @planner.save
        redirect "/planners/#{@planner.id}"

       #if baby name field has data and existing baby is not selecting then create new baby, new planner and associate new baby with planner.
      elsif params[:baby][:name] != ""  && params[:baby][:babys_id] == nil
        baby = current_user.babies.build(name: params[:baby][:name])
        baby.save

        @planner = baby.planners.build(wake_time: params[:planners][:wake_time], bed_time: params[:planners][:bed_time],
        notes: params[:planners][:notes], morning_nap_start_time: params[:planners][:morning_nap_start_time],
        morning_nap_end_time: params[:planners][:morning_nap_end_time], morning_nap_total_time: params[:planners][:morning_nap_total_time], midday_nap_start_time: params[:planners][:midday_nap_start_time],
        midday_nap_end_time: params[:planners][:midday_nap_end_time], midday_nap_total_time: params[:planners][:midday_nap_total_time], late_afternoon_nap_start_time: params[:planners][:late_afternoon_nap_start_time],
        late_afternoon_nap_end_time: params[:planners][:late_afternoon_nap_end_time], late_afternoon_nap_total_time: params[:planners][:late_afternoon_nap_total_time], total_nap_time: params[:planners][:total_nap_time] )
        @planner.save
        redirect "/planners/#{@planner.id}"

      #if baby name field has data and existing baby is selected then redirect to new.
     else params[:baby][:name] != ""  && params[:baby][:babys_id] != nil
         flash[:message] = "More than one baby was selected, please try again"
         redirect '/planners/new'
     end
   else
      redirect '/login'
   end
 end


  #show route for a planner entry.
  get '/planners/:id' do
    if logged_in?
      find_planner_by_params_id

      erb :'/planners/show_planner'
    else
      redirect '/login'
    end
  end


  #get planners/:id/edit to render form to edit a planner.

  get '/planners/:id/edit' do

   if logged_in?
     find_planner_by_params_id
     @babies = current_user.babies
     if planner_baby_user_equals_current_user
       erb :'/planners/edit'
     else
       redirect '/babies'
     end
   else redirect '/login'
   end
 end

  #patch planners to update a planner.
  patch '/planners/:id' do
    if logged_in?
      find_planner_by_params_id
        if planner_baby_user_equals_current_user

          @planner.update(wake_time: params[:planners][:wake_time], bed_time: params[:planners][:bed_time],
          notes: params[:planners][:notes], morning_nap_start_time: params[:planners][:morning_nap_start_time],
          morning_nap_end_time: params[:planners][:morning_nap_end_time], morning_nap_total_time: params[:planners][:morning_nap_total_time], midday_nap_start_time: params[:planners][:midday_nap_start_time],
          midday_nap_end_time: params[:planners][:midday_nap_end_time], midday_nap_total_time: params[:planners][:midday_nap_total_time], late_afternoon_nap_start_time: params[:planners][:late_afternoon_nap_start_time],
          late_afternoon_nap_end_time: params[:planners][:late_afternoon_nap_end_time], late_afternoon_nap_total_time: params[:planners][:late_afternoon_nap_total_time],total_nap_time: params[:planners][:total_nap_time] )


          redirect "/planners/#{@planner.id}"
      end
    else
      redirect '/login'
    end
  end

  #delete planners to delete a planner.
  delete '/planners/:id' do
    if logged_in?
       find_planner_by_params_id
        if planner_baby_user_equals_current_user
          @planner.destroy
          flash[:message] = "Planner has been deleted."
          redirect '/babies'
        else
          redirect '/babies'
        end
     else
       redirect '/login'
     end
  end

  private

  def find_planner_by_params_id
    @planner = Planner.find_by(id: params[:id])
  end

  def planner_baby_user_equals_current_user
    @planner.baby.user == current_user
  end

end
