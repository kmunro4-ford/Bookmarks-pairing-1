require 'bookmark'

describe Bookmark do
    it 'returns a list of bookmarks' do
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.thisnewwebsite.com', 'New Test Website');")
      expect(Bookmark.all).to include("New Test Website")
    end
    it 'enters a bookmark into the table' do
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      Bookmark.add_to_table("http://www.thisnewwebsite.com", "New Test Website")
      expect(Bookmark.all).to include("New Test Website")
    end
    it 'deletes a bookmark from the table' do
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      Bookmark.add_to_table("http://www.thisnewwebsite.com", "New Test Website")
      expect(Bookmark.all).to include("New Test Website")
      Bookmark.remove_from_table("New Test Website")
      expect(Bookmark.all).to_not include("New Test Website")
    end
end
