FactoryGirl.define do

  factory :user do
    first_name 'John'
    last_name  'Smith'
    user_name  'JohnSmith'
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'mysweetpassword'
  end
end
