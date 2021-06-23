class Bookmark

  def self.all
    # bookmark_array = ["www.google.com", "www.bing.com", "www.ign.com"]
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      res = conn.exec_params('SELECT url FROM bookmarks')
      return res.values.join(", ")
    else
      conn = PG::Connection.open(:dbname => 'bookmark_manager')
      res = conn.exec_params('SELECT url FROM bookmarks')
      return res.values.join(", ")
    end
  end

  def self.add_to_table(bookmark)
    if ENV['ENVIRONMENT'] == 'test'
      conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
      conn.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}');")
    else
      conn = PG::Connection.open(:dbname => 'bookmark_manager')
      conn.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}');")
    end
  end

end
