require 'spec_helper'

feature 'user signs up',%Q{
  As a unauthenticated foodie
  I want to sign up
  So that I can review food trucks
}do

# ACCEPTANCE CRITERIA
#
# I provide user name, first name, last name, email, password, password confirmation
# If I don't specify the required information I am shown an error and redirected to the sign up page
# If I am successful, I am greeted with a message, logged in, and brought to the home page

  scenario 'with valid information' do
    prev_count = User.count

    visit root_path
    click_link 'Sign Up'

    fill_in 'User Name', with: 'foodie01'
    fill_in 'First Name', with: 'Roger'
    fill_in 'Last Name', with: 'Moore'
    fill_in 'Email', with: 'roger.moore@gmail.com'
    fill_in 'user_password', with: 'rogerspassword'
    fill_in 'user_password_confirmation', with: 'rogerspassword'

    click_button 'Sign Up'

    expect( User.count ).to eql( prev_count + 1 )

    page.should have_content('Welcome!')
    page.should have_content('Sign Out')

    page.should_not have_content('Sign Up')
    page.should_not have_content('Sign In')

  end

 scenario 'with invalid information' do
   prev_count = User.count

    visit root_path
    click_link 'Sign Up'

    click_button 'Sign Up'

    expect( User.count ).to eql( prev_count )

    page.should_not have_content('Welcome!')
    page.should_not have_content('Sign Out')

    page.should have_content('Sign Up')
    page.should have_content('Sign In')
    page.should have_content("can't be blank")

   end
end
