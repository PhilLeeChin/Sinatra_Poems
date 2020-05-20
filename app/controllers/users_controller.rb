class UsersController < ApplicationController

  get '/users/new' do #display form to add new users
    erb :'users/new_user'
  end

  post '/users' do #add new users to app
    binding.pry
    new_user = User.new(params)

    if new_user.save
      session[:user_id] = new_user.id
      redirect '/poems'
    else
      erb :'users/new'
    end
  end
end
