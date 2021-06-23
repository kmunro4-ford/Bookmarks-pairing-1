def test_adding_new_bookmark_method
  visit('/')
  fill_in :new_bookmark, with: 'http://www.thisnewwebsite.com'
  click_button 'Submit'
  click_button 'Go Back'
end
