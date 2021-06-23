feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.thisnewwebsite.com', 'New Test Website');")
    visit('/')
    expect(page).to have_content "New Test Website"
  end
  scenario 'view bookmarks' do
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.thisnewwebsite.com', 'New Test Website');")
    visit('/bookmarks')
    expect(page).to have_content "New Test Website"
  end
end

feature 'Adding bookmarks' do
  scenario 'add a bookmark' do
    test_adding_new_bookmark_method
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    expect(page).to have_content "New Test Website"
  end
end
