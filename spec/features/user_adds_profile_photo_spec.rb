require 'spec_helper'

feature 'authenicated user adds a profile photo',%Q{
  As an authenticated foodie
  I want to upload a profile photo
  So that people know what I look like
}do

# ACCEPTANCE CRITERIA
#
# The image must be in a valid format( jpeg, png, ... )
# The image must within width/height and file size restrictions
# If I do not upload this type of photo, I get an error message
# If I am successful, I can see my image on my profile

  describe 'a signed in user' do

    before(:each) do
     user = FactoryGirl.create(:user)
     sign_in( user )
    end

    scenario 'with an image selected' do
      page.should have_content('Upload a Photo')
      page.attach_file('user_photo', Rails.root + 'spec/support/images/image.jpg')
      click_on 'Update User'
      page.should have_content('Photo Updated')
    end

    scenario 'without an image selected' do
      click_on 'Update User'
      page.should have_content('Please provide a photo')
    end
  end


end
