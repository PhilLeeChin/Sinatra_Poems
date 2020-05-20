class SessionsController < ApplicationController
  get '/login' do
    erb :'sessions/new_session'
  end

  post '/login' do
    new_user = User.find_by(username: params[:username])

    if new_user && new_user.authenticate(params[:password])
      session[:user_id] = new_user.id
      redirect to '/poems'
    else
      'Incorrect login credentials, Try again.'
      erb :'sessions/new_session'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end
