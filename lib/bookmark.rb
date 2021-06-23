class Bookmark

  def self.all
    self.setup
    res = @conn.exec_params('SELECT title FROM bookmarks')
    return res.values.join(", ")
  end

  def self.add_to_table(bookmark_url, bookmark_title)
    self.setup
    @conn.exec("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark_url}', '#{bookmark_title}');")
  end

  private
  def self.setup
    if ENV['ENVIRONMENT'] == 'test'
      @conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    else
      @conn = PG::Connection.open(:dbname => 'bookmark_manager')
    end
  end

end
