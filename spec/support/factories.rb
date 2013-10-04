FactoryGirl.define do

  factory :user do
    first_name 'John'
    last_name  'Smith'
    user_name  'JohnSmith'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'mysweetpassword'
  end

  factory :food_truck do
    sequence(:name){|n|"food truck #{n}"}
    city 'Boston'
    picture 'image1.jpg'
    food_category 'Fast food'

    factory :food_truck_with_reviews do
      after(:create) do |food_truck|
        FactoryGirl.create_list(:review, 5, food_truck: food_truck )
      end
    end

  end

  factory :review do
    sequence(:body){|n|"I like it!#{n}"}
    association :user

    is_good true
  end

  factory :vote do
    user
    food_truck
    voted_up true
  end

end

