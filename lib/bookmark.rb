require './lib/database_connection'

class Bookmark

  def self.all
    res = DatabaseConnection.query("SELECT title FROM bookmarks")
    return res.values.join(", ")
  end

  def self.add_to_table(bookmark_url, bookmark_title)
    DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES ('#{bookmark_url}', '#{bookmark_title}');")
  end

  def self.remove_from_table(bookmark_title)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE title = '#{bookmark_title}';")
  end

  def self.edit_bookmark_from_table(old_title, new_title, new_url)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{new_url}', title = '#{new_title}' WHERE title = '#{old_title}';")
  end

end
