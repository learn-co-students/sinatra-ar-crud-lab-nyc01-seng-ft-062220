
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

  #create
  get '/articles/new' do
    erb :new
  end

  #create
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  #read
  get '/articles' do    
    @articles = Article.all
    erb :index
  end

  #read
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  #update
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  #update
  patch '/articles/:id' do
    #binding.pry
    @article = Article.find(params[:id])
    #binding.pry
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  #delete
  delete '/articles/:id' do
    @article = Article.destroy(params[:id])
    redirect to "/articles"
  end

end
