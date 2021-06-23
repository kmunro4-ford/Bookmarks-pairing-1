require 'bookmark'

describe Bookmark do
    it 'returns a list of bookmarks' do
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      expect(Bookmark.all).to include("http://www.makersacademy.com")
    end
    it 'enters a bookmark into the table' do
      Bookmark.add_to_table("http://www.thisnewwebsite.com")
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      expect(Bookmark.all).to include("http://www.thisnewwebsite.com")
    end
end
