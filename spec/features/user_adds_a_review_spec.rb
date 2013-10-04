require 'spec_helper'

feature 'user reviews and rates a food truck', %Q{
  As an authenticated food truck lover
  I want to rate a food truck
  So that I an give my opinion about the truck
} do

  # ACCEPTANCE CRITIERA
  #
  # I must declare the truck as good or bad ( or whatever adjectives we choose )
  # I see that I made a rating when I do so
  # The new stats are visible on the screen
  # I can optionally review the truck

  scenario 'user provides the required information' do
    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)

    total_count = Review.count
    user_review_count = user.reviews.count

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    click_on truck.name
    click_on "Add review"

    fill_in 'Body', with: 'Totally awesome!'
    choose 'Good'

    click_on 'Create Review'

    expect(Review.count).to eql(total_count + 1)
    expect( user.reviews.count ).to eql( user_review_count + 1 )
    expect(page).to have_content('Review is created successfully')

    expect(page).to have_content(truck.name)

  end

  describe 'user does not provide the required information' do
    scenario 'User provides no information' do

      user = FactoryGirl.create(:user)
      truck = FactoryGirl.create(:food_truck)

      prev_count = Review.count
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign In'

      visit new_food_truck_review_path(truck)

      click_on 'Create Review'

      expect(Review.count).to eql(prev_count)
      expect(page).to have_content("can't be blank")

    end
    scenario 'User provides body, but no is_good' do

      user = FactoryGirl.create(:user)
      truck = FactoryGirl.create(:food_truck)

      prev_count = Review.count
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Sign In'

      visit new_food_truck_review_path(truck)

      fill_in 'Body', with: 'SOOOOO GOOOD'

      click_on 'Create Review'

      expect(Review.count).to eql(prev_count)
      expect(page).to have_content("must be filled")

    end
  end
  scenario 'User cancels making a review' do
    truck = FactoryGirl.create(:food_truck)

    visit food_truck_reviews_path(truck)
    click_on 'Add review'
    click_on 'Cancel'

    expect(page).to have_content(truck.name)
  end



end
