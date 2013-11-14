FactoryGirl.define do

  factory :user do
    first_name 'John'
    last_name  'Smith'
    user_name  'JohnSmith'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'mysweetpassword'

    factory :user_with_reviews do
      after(:create) do |user|
        food_truck = FactoryGirl.create(:food_truck, user: user)
        FactoryGirl.create_list(:review, 5, user: user, food_truck: food_truck)
      end
    end

    factory :user_with_food_trucks do
      after(:create) do |user|
        FactoryGirl.create(:food_truck, user: user)
      end
    end
  end

  factory :food_truck do
    sequence(:name){|n| "food#{n} truck" }
    photo Rack::Test::UploadedFile.new(File.open(File.join( Rails.root, 'spec/support/images/image.jpg')))

    factory :food_truck_with_reviews do
      after(:create) do |food_truck|
        FactoryGirl.create_list(:review, 5, food_truck: food_truck )
      end
    end

  end

  factory :review do
    sequence(:body){|n| "I like#{n} it!"}
  end

  factory :vote do
    voted_up true
  end

end
