require 'spec_helper'

feature 'user views reviews' do

  scenario 'all of the reviews are listed' do

    truck = FactoryGirl.create(:food_truck_with_reviews)

    visit food_truck_reviews_path( truck )

    Review.all.each do |review|
      expect(page).to have_content( review.body )
    end

  end

end
