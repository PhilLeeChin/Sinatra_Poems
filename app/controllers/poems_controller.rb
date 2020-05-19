class PoemsController < Sinatra::Base
  get '/poems' do
    #redirect '/' if !(is_logged_in?)

    @all_poems = Poems.all

    erb :'poems/pray'
  end

  get '/poems/new' do
    erb :'poems/new'
  end

  post '/poems' do
    @new_poems = Poems.new(params)

    @new_poems.save

    redirect '/poems/#{@new_poems.id}'
  end

  get '/poems/:id' do
    #redirect '/' if !(is_logged_in?)
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

  patch '/rooms/:id' do

  end
end
