feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    visit('/')
    expect(page).to have_content "http://www.makersacademy.com"
  end
  scenario 'view bookmarks' do
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
  end
end

feature 'Adding bookmarks' do
  scenario 'add a bookmark' do
    test_adding_new_bookmark_method
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    expect(page).to have_content "http://www.thisnewwebsite.com"
  end
end
