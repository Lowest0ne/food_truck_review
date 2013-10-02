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

    prev_count = Review.count

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit new_food_truck_review_path(truck)


    fill_in 'Body', with: 'Totally awesome!'
    choose 'Good'

    click_on 'Create Review'

    expect(Review.last.user_id).to eql(user.id)
    expect(Review.last.food_truck_id).to eql(truck.id)

    expect(Review.count).to eql(prev_count + 1)
    expect(page).to have_content('Review is created successfully')

  end

  scenario 'user does not provide the required information' do
    user = FactoryGirl.create(:user)
    truck = FactoryGirl.create(:food_truck)
    review = FactoryGirl.create(:review)

    prev_count = Review.count
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    visit new_food_truck_review_path(truck)

    click_on 'Create Review'

    expect(Review.last.user_id).to_not eql(user.id)
    expect(Review.last.food_truck_id).to_not eql(truck.id)

    expect(Review.count).to eql(prev_count)
    expect(page).to have_content("can't be blank")

  end


end