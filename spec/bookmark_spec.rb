require 'bookmark'

describe Bookmark do
    it 'returns a list of bookmarks' do
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      expect(Bookmark.all).to include("http://www.makersacademy.com")
    end
end
