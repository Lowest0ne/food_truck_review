FactoryGirl.define do

  factory :user do
    first_name 'John'
    last_name  'Smith'
    user_name  'JohnSmith'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'mysweetpassword'
  end

  factory :food_truck do
    name'Chicken n Rice'
    city 'Boston'
    picture 'image1.jpg'
    food_category 'Fast food'

  end

  factory :review do
    body 'I like it!'
    user
    food_truck

    is_good true
  end

end

