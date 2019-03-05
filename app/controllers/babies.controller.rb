class BabiesController < ApplicationController

  #index route for all baby entries.
  get '/babies' do
    if logged_in?
      @babies = current_user.babies
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
    if logged_in? && params[:name] != ""
      @baby = current_user.babies.build(params)
      @baby.save
      redirect "/babies/#{@baby.id}"

    elsif logged_in? && params[:name] == ""
      redirect 'babies/new'
    else
      redirect '/login'
    end
  end

  #show route for a baby entry.
  get '/babies/:id' do
    if logged_in?

      @baby = Baby.find_by(id: params[:id])
      erb :'/babies/show_baby'
    else
      redirect '/login'
    end
  end


  #get babies/:id/edit to render form to edit a baby.
  get '/babies/:id/edit' do
   if logged_in?
     @baby = Baby.find_by(id: params[:id])
     if @baby.user == current_user
       erb :'/babies/edit'
     else
       redirect '/babies'
     end
   else redirect '/login'
   end
 end

 #patch babies to update a baby.
  post '/babies/:id' do
    if logged_in?
      @baby = Baby.find_by(id: params[:id])
      if @baby.user == current_user && params[:name] != ""
        @baby.update(name: params[:name])
        redirect "/babies/#{@baby.id}"
      else
        redirect "/babies"
      end
    else
      redirect '/login'
   end
 end

 #delete babies to delete a baby.
 delete '/babies/:id' do
   if logged_in?
      @baby = Baby.find_by(id: params[:id])
       if @baby.user == current_user
         @baby.destroy
         redirect '/babies'
       else
         redirect '/babies'
       end
    else
      redirect '/login'
    end
 end


end

#NEED TO LOOK AT EDIT AND DELETE METHODS
