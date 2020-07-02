class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect '/recipes'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "recipes/#{recipe.id}"
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name]) if params[:name] != ""
    @recipe.update(ingredients: params[:ingredients]) if params[:ingredients] != ""
    @recipe.update(cook_time: params[:cook_time]) if params[:cook_time] != ""
    erb :show
  end

  delete '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.delete
    redirect '/recipes'
  end


end
