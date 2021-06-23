def tidy_up
  conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
  conn.exec("TRUNCATE bookmarks;")
end
