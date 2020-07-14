class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end
  
  get '/recipes/:id' do
    get_recipe
    if @recipe
      erb :show
    else
      erb :failure
    end
  end
  
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id/edit' do
    get_recipe
    if @recipe
      erb :edit
    else
      erb :failure
    end
  end

  patch '/recipes/:id' do
    get_recipe
    @recipe.name = params[:recipe][:name]
    @recipe.ingredients = params[:recipe][:ingredients]
    @recipe.cook_time = params[:recipe][:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    get_recipe
    @recipe.delete
    redirect '/recipes'
  end

  private

  def get_recipe
    @recipe = Recipe.find_by_id(params[:id])
  end


end
