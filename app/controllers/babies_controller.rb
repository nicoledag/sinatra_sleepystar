class BabiesController < ApplicationController

  #index route for all baby entries.
  get '/babies' do
      redirect_if_not_logged_in
      @babies = current_user.babies
      erb :'babies/babies'
  end


  # get babies/new to render a form to create a new entry.
  get '/babies/new' do
    redirect_if_not_logged_in
     erb :'/babies/new'
  end

  #post babies to create a new baby entry.
  post '/babies' do

    redirect_if_not_logged_in
    if params[:name] != ""
      @baby = current_user.babies.build(params)
      @baby.save
      redirect "/babies/#{@baby.id}"

    else params[:name] == ""
      flash[:message] = "The name field was left blank, please try again"
      redirect 'babies/new'
    end
  end

  #show route for a baby entry.
  get '/babies/:id' do

      redirect_if_not_logged_in
      find_baby_by_params_id
      erb :'/babies/show_baby'
  end


  #get babies/:id/edit to render form to edit a baby.
  get '/babies/:id/edit' do
   redirect_if_not_logged_in
     find_baby_by_params_id
     if @baby.user == current_user
       erb :'/babies/edit'
     else
       redirect '/babies'
     end
 end

 #patch babies to update a baby.
  patch '/babies/:id' do
     redirect_if_not_logged_in
      find_baby_by_params_id
      if @baby.user == current_user && params[:name] != ""
        @baby.update(name: params[:name])
        redirect "/babies/#{@baby.id}"
      else
        redirect "/babies"
      end
  end

 #delete babies to delete a baby.
  delete '/babies/:id' do
    redirect_if_not_logged_in
      find_baby_by_params_id
       if @baby.user == current_user
         @baby.destroy
         flash[:message] = "Baby has been deleted."
         redirect '/babies'
       else
         redirect '/babies'
       end
  end

 private

 def find_baby_by_params_id
   @baby = Baby.find_by(id: params[:id])
 end


end
