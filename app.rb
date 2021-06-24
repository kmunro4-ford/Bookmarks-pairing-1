require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    enable :sessions
  end

  get '/' do
    erb :index
    redirect "/bookmarks"
  end

  get '/bookmarks' do
    @bookmark_list = Bookmark.all
    erb :bookmark
  end

  post '/add_bookmark' do
    session[:new_bookmark_url] = params[:new_bookmark_url]
    session[:new_bookmark_title] = params[:new_bookmark_title]
    Bookmark.add_to_table(session[:new_bookmark_url], session[:new_bookmark_title])
    redirect "/add_bookmark_get"
  end

  get '/add_bookmark_get' do
    @url = session[:new_bookmark_url]
    @title = session[:new_bookmark_title]
    erb :new_bookmark
  end

  post '/remove_bookmark' do
    session[:remove_bookmark_title] = params[:remove_bookmark_title]
    Bookmark.remove_from_table(session[:remove_bookmark_title])
    redirect "remove_bookmark_get"
  end

  get '/remove_bookmark_get' do
    @remove = session[:remove_bookmark_title]
    erb :remove_bookmark
  end

  run! if app_file == $0
end
