def test_adding_new_bookmark_method
  visit('/')
  fill_in :new_bookmark_url, with: 'http://www.thisnewwebsite.com'
  fill_in :new_bookmark_title, with: 'New Test Website'
  click_button 'Submit'
  click_button 'Go Back'
end

def test_removing_a_bookmark_method
  fill_in :remove_bookmark_title, with: 'New Test Website'
  click_button 'Submit2'
  click_button 'Go Back'
end

def test_editing_a_bookmark_method
  fill_in :edit_bookmark_old_title, with: 'New Test Website'
  fill_in :edit_bookmark_new_title, with: 'Where am I'
  fill_in :edit_bookmark_new_url, with: 'www.engima.com'
  click_button 'Submit3'
  click_button 'Go Back'
end
