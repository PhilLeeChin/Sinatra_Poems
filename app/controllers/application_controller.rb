require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  get "/" do #Shows welcome page
    erb :welcome
  end

  helpers
    def is_logged_in?
      session.has_key?(:user_id)
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if is_logged_in?
    end
end
