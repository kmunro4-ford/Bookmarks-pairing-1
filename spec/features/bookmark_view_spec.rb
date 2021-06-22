feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
  scenario 'view bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content ["www.google.com", "www.bing.com", "www.ign.com"]
  end
end
