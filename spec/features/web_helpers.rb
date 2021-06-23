def test_adding_new_bookmark_method
  visit('/')
  fill_in :new_bookmark_url, with: 'http://www.thisnewwebsite.com'
  fill_in :new_bookmark_title, with: 'New Test Website'
  click_button 'Submit'
  click_button 'Go Back'
end
