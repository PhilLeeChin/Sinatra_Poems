class PoemsController < ApplicationController
  get '/poems' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    user = Helpers.current_user(session)
    @poems = user.poems.all

    erb :'poems/index'
  end

  get '/poems/new' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    erb :'poems/new'
  end

  post '/poems' do
    user = Helpers.current_user(session)
    @poem = user.poems.new(title: params[:title], author: params[:author], poem: params[:poem])
    # binding.pry
    if @poem.save
      redirect to "/poems/#{@poem.id}"
    else
      erb :'/errors/new_error'
    end
  end

  get '/poems/:id' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    if @poem = Helpers.get_poems(params,session)
      erb :'poems/show'
    else
      erb :'/errors/no_poem'
    end
  end

  get '/poems/:id/edit' do
    redirect '/' if !(Helpers.is_logged_in?(session))
    @id = params[:id]
    user = Helpers.current_user(session)
    if @poem = Helpers.get_poems(params, session)
      erb :'/poems/re_compose'
    else
      erb :'errors/no_poem'
    end
  end

  patch '/poems/:id/edit' do
    @poem = Helpers.get_poems(params, session)
    # binding.pry
    @poem.title = params[:title]
    @poem.author = params[:author]
    @poem.poem = params[:poem]
    if @poem.save
      redirect "/poems/#{params[:id]}"
    else
      flash[:danger] = "Please fill in all details."
      redirect "/poems/#{params[:id]}/new"
    end
  end

  delete "/poems/:id/delete" do
    @poem = Poem.find_by_id(params[:id])
    if @poem.destroy
      redirect "/poems"
    else
      redirect "/poems/#{@poem.id}"
    end
  end
end
