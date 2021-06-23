require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
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
    @url = params[:new_bookmark_url]
    @title = params[:new_bookmark_title]
    Bookmark.add_to_table(@url, @title)
    redirect "/add_bookmark_get"
  end

  get '/add_bookmark_get' do
    erb :new_bookmark
  end

  post '/remove_bookmark' do
    @remove = params[:remove_bookmark_title]
    Bookmark.remove_from_table(@remove)
    redirect "remove_bookmark_get"
  end

  get '/remove_bookmark_get' do
    erb :remove_bookmark
  end

  run! if app_file == $0
end
