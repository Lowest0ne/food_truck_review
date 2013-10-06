require 'spec_helper'

feature 'user views reviews' do

  scenario 'all of the reviews are listed' do

    user = FactoryGirl.create(:user_with_food_trucks)
    truck = user.food_trucks.last
    FactoryGirl.create_list(:review, 5, user: user, food_truck: truck)

    visit food_truck_reviews_path( truck )

    Review.all.each do |review|
      expect(page).to have_content( review.body )
    end

  end

end
