require 'spec_helper'

feature 'user views trucks' do

  scenario 'all of the trucks are listed' do

    FactoryGirl.create_list(:user_with_food_trucks, 5)

    visit food_trucks_path

    FoodTruck.all.each do |truck|
      expect(page).to have_content( truck.name )
    end

  end

  scenario 'pagination setting lists five trucks at a time' do
    FactoryGirl.create_list(:user_with_food_trucks, 15)

    visit food_trucks_path
    expect(page).to have_content('Next')
    expect(page).to have_content('Last')

    food_trucks = FoodTruck.order(:name)

    expect(page).to have_content(food_trucks.first.name)
    expect(page).to_not have_content(food_trucks.last.name)

    click_link 'Last'
    expect(page).to have_content('First')
    expect(page).to have_content('Prev')

    expect(page).to have_content(food_trucks.last.name)
    expect(page).to_not have_content(food_trucks.first.name)
  end

end
