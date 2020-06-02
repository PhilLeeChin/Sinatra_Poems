class UsersController < ApplicationController
  get '/login' do #display form to add new users
    erb :'/users/c_user'
  end

  post '/login' do #add new users to app
    #binding.pry
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to '/poems'
    else
      erb :'/errors/login_error'
    end
  end

  get '/register' do
    erb :'/users/register'
  end

  post '/register' do
    @user = User.new(username: params[:username],
    email: params[:email],
    password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/poems'
    else
      erb :'/errors/register_error'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
