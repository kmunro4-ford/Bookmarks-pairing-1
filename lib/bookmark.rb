class Bookmark

  def self.all
    # bookmark_array = ["www.google.com", "www.bing.com", "www.ign.com"]
    conn = PG::Connection.open(:dbname => 'bookmark_manager')
    res = conn.exec_params('SELECT url FROM bookmarks')

    return res.values.join(", ")
  end

end
