require 'spec_helper'

feature 'user signs in',%Q{
  As an unauthenticated user
  I want to sign in
  So I can use the site as intended
} do

# Acceptance Criteria
#
# I must offer my email and password
# If my offering is true, then I am logged in
# If my offering is rejected, then I am told so

  scenario 'user with valid credentials is signed in' do

    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'

    page.should have_content('Please enter your credentials')

    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Sign In'

    page.should have_content('Welcome Back')
    page.should have_content('Sign Out')

    page.should_not have_content('Sign In')
    page.should_not have_content('Sign Up')

    page.should_not have_content('Upload')
    page.should have_content('My Profile')
    page.should have_content('All the food trucks')
  end

  scenario 'registered users who forget passwords are not signed in' do

    user = FactoryGirl.create(:user)
    user.password = 'wrongpassword'

    sign_in(user)

    page.should have_content('Invalid email or password')
    page.should have_content('Sign In')

    page.should_not have_content('Sign Out')

  end

  scenario 'un registered user is not signed in' do

    visit new_user_session_path
    fill_in 'user_email', with: 'not@exist.com'
    fill_in 'user_password', with: 'neverhere'

    click_button 'Sign In'

    page.should have_content('Invalid email or password')
    page.should have_content('Sign In')

    page.should_not have_content('Sign Out')

  end


end
