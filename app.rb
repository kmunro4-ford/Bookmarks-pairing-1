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
    @new_bookmark_url = params[:new_bookmark_url]
    @new_bookmark_title = params[:new_bookmark_title]
    Bookmark.add_to_table(@new_bookmark_url, @new_bookmark_title)
    erb :new_bookmark
  end

  run! if app_file == $0
end
