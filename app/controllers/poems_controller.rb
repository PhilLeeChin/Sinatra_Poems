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
    # binding.pry
    if @new_poems.save
      redirect to '/poems/#{user.poems.count}'
    else
      erb :'/poems/new_error'
    end
  end

  get '/poems/:id' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    if @all_poems = Helpers.get_poems(params,session)
      erb :'poems/show'
    else
      erb :'/errors/no_poem'
    end
  end

  get '/poems/:id/edit' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    @id = params[:id]
    user = Helpers.current_user(session)
    if @all_poems = Helpers.get_poems(params, session)
      erb :'/poems/re_compose'
    else
      erb :'errors/no_poem'
    end
  end

  patch '/poems/:id/edit' do
    @all_poems = Helpers.get_poems(params, session)
    @all_poems.title = params[:title]
    @all_poems.author = params[:author]
    @all_poems.date_created = params[:date_created]
    @all_poems.poem = params[:poem]
    if @all_poems.save
      redirect '/poems/#{params[:id]}'
    else
      flash[:danger] = 'Please fill in all details.'
      redirect '/poems/#{params[:id]}/new'
    end
  end

  delete '/poems/:id/delete' do
    Poem.find(params[:id]).delete
    redirect '/poems'
  end
end
