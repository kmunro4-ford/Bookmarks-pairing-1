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

  def self.remove_from_table(bookmark_title)
    self.setup
    @conn.exec("DELETE FROM bookmarks WHERE title = '#{bookmark_title}';")
  end

  def self.edit_bookmark_from_table(old_title, new_title, new_url)
    self.setup
    @conn.exec("UPDATE bookmarks SET url = '#{new_url}', title = '#{new_title}' WHERE title = '#{old_title}';")
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
