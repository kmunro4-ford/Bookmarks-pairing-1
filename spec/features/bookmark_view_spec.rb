feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
  scenario 'view bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com, http://www.twitter.com, http://www.google.com, http://www.destroyallsoftware.com"
  end
end
