class Bookmark

  def self.all
    self.setup
    res = @conn.exec_params('SELECT url FROM bookmarks')
    return res.values.join(", ")
  end

  def self.add_to_table(bookmark)
    self.setup
    @conn.exec("INSERT INTO bookmarks (url) VALUES ('#{bookmark}');")
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
