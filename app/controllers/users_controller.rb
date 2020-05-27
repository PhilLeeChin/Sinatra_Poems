class UsersController < ApplicationController
  get '/login' do #display form to add new users
    erb :'/users/new_user'
  end

  post '/login' do #add new users to app
    #binding.pry
    @new_user = User.find_by(username: params[:username])
    if @new_user && @new_user.authenticate(params[:password])
      session[:user_id] = @new_user.id
      redirect to '/poems'
    else
      erb :'/errors/login_error'
    end
  end

  get '/register' do
    erb :'/users/register'
  end

  post '/register' do
    @new_user = User.new(username: params[:username],
    email: params[:email],
    password: params[:password])
    if @new_user.save
      session[:user_id] = @new_user.id
      redirect '/poems'
    else
      erb :'/users/register_error'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
