require 'sinatra/base'
require 'sinatra/reloader'
require 'pg'
require './lib/bookmark'
require './lib/database_connection_setup'

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

  post '/edit_bookmark' do
    session[:edit_bookmark_old_title] = params[:edit_bookmark_old_title]
    session[:edit_bookmark_new_title] = params[:edit_bookmark_new_title]
    session[:edit_bookmark_new_url] = params[:edit_bookmark_new_url]
    Bookmark.edit_bookmark_from_table(session[:edit_bookmark_old_title], session[:edit_bookmark_new_title], session[:edit_bookmark_new_url])
    redirect "edit_bookmark_get"
  end

  get '/edit_bookmark_get' do
    @edit_old_title = session[:edit_bookmark_old_title]
    @edit_new_title = session[:edit_bookmark_new_title]
    @edit_new_url = session[:edit_bookmark_new_url]
    erb :edit_bookmark
  end

  run! if app_file == $0
end
