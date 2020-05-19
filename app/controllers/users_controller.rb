class UsersController < ApplicationController

  get '/users/new' do #display form to add new users
    erb ':users/new'
  end

  post '/' do #add new users to app
    binding.pry
  end
end
