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
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    test_adding_new_bookmark_method
    expect(page).to have_content "New Test Website"
  end
end

feature 'Removing bookmarks' do
  scenario 'remove a bookmark' do
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    test_adding_new_bookmark_method
    expect(page).to have_content "New Test Website"
    test_removing_a_bookmark_method
    expect(page).to_not have_content "New Test Website"
  end
end

feature 'Editing a bookmark' do
  scenario 'edit New Test Webiste bookmark' do
    conn = PG::Connection.open(:dbname => 'bookmark_manager_test')
    test_adding_new_bookmark_method
    expect(page).to have_content "New Test Website"
    test_editing_a_bookmark_method
    expect(page).to_not have_content "New Test Website"
    expect(page).to have_content "Where am I"
  end
end
