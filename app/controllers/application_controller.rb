class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
  redirect to '/recipes'
end
  get '/recipes' do
  @recipes = Recipe.all
  erb :index
  end
  get '/recipes/new' do
    erb :new
  end
  post '/recipes' do
    @recipe = Recipe.new(params)
     if @recipe.save
      redirect to "/recipes/#{@recipe.id}"
    else
      redirect to '/error'
    end
  end
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end
  get "/recipes/:id/edit" do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  patch "/recipes/:id" do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{ @recipe.id }"
  end
  delete '/recipes/:id' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end
  get '/error' do
    erb :error
  end
end


















