class PoemsController < ApplicationController
  get '/poems' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    user = Helpers.current_user(session)
    @all_poems = user.poems.all

    erb :'poems/index'
  end

  get '/poems/new' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    erb :'poems/new'
  end

  post '/poems' do
    user = Helpers.current_user(session)
    @new_poems = user.poems.new(params)

    if @new_poems.save
      redirect to '/poems/#{user.poems.count}'
    else
      erb :'/poems/new.error'
    end
  end

  get '/poems/:id' do
    redirect '/' if !(is_logged_in?)
    @poems_obj = Poems.find_by(id: params[:id])

    if @poems_obj
      erb :'poems/list.html'
    else
      redirect '/poems'
    end
  end

  get '/poems/:id/edit' do
    redirect '/' if !(is_logged_in?)
    @poems_obj = Poems.find_by(id: params[:id])

    erb :'/poems/edit'
  end
end
