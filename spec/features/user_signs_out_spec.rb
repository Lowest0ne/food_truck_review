require 'spec_helper'

feature 'user signs out',%Q{
  As an authenticated user
  I want to sign out
  because the world is a scary place
} do

# Acceptance Criteria
#
# I can sign out if I am signed in
# I can not sign out if I am not signed in

  scenario 'a signed in user can sign out' do

    user = FactoryGirl.create(:user)
    sign_in(user)

    visit root_path
    click_link 'Sign Out'

    page.should have_content('Thanks for visiting')
    page.should have_content('Sign In')

    page.should_not have_content('Sign Out')
  end

  scenario 'a non signed in user can not sign out' do
    visit root_path

    page.should_not have_content('Sign Out')
  end
end
