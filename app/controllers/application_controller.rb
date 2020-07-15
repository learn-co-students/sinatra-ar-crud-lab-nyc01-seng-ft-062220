
require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  get '/' do
    redirect to "/articles"
  end

  # read
  get '/articles' do
    @articles = Article.all

    erb :index
  end

  # create 
  get '/articles/new' do
    @articles = Article.new

    erb :new
  end

   # create
   post '/articles' do
    @articles = Article.create(params)
    redirect to "/articles/#{@articles.id}"
  end

  # read
  get '/articles/:id' do
    @articles = Article.find(params[:id])

    erb :show
  end

  # edit
  get '/articles/:id/edit' do
    @articles = Article.find(params[:id])

    erb :edit
  end

  # update
  patch "/articles/:id" do
    @articles = Article.find(params[:id])
    @articles.update(params[:article])

    redirect to "/articles/#{ @articles.id }"
  end

 

  # delete
  delete '/articles/:id' do
    @articles = Article.find(params[:id])
    @articles.destroy

    redirect to '/articles'
  end
end
