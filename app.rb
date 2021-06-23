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
    @new_bookmark = params[:new_bookmark]
    Bookmark.add_to_table(@new_bookmark)
    erb :new_bookmark
  end

  run! if app_file == $0
end
