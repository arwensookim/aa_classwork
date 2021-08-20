require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do     # feature : describe
  feature 'signing up a user' do
    # before(:each) do
    background(:each) do
        visit "/users/new"
        # visit new_user_url
        fill_in 'username', with: ''
        fill_in 'password', with: ''
        click_on 'Sign Up'
    end

    scenario 'has a singup page'
        expect(page).to have_content('Sign Up')
    end

    scenario 'redirects to team index page after signup'
        expect(page).to have_content 'Team Index Page'
    end

    scenario 'shows username on the homepage after signup'
        expect(page).to have_content 'testing_username'
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end



# # visiting page
# visit('/projects')
# visit(post_comments_path(post))


# # clicking
# click_link('id-of-link')
# click_link('Link Text')
# click_button('Save')
# click_on('Link Text') # clicks on either links or buttons
# click_on('Button Value')

# # forms
# fill_in('Password', with: 'Seekrit')
# fill_in('Description', with: 'Really Long Text...')
# choose('A Radio Button')
# check('A Checkbox')
# uncheck('A Checkbox')
# attach_file('Image', '/path/to/image.jpg')
# select('Option', from: 'Select Box')

# # Content (page)
# expect(page).to have_content('Blah blah blah')