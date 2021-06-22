require 'bookmark'

describe Bookmark do
    it 'returns a list of bookmarks' do
      p Bookmark.all
      expect(Bookmark.all).to include("http://www.makersacademy.com", "http://www.twitter.com", "http://www.google.com", "http://www.destroyallsoftware.com")
    end
end
