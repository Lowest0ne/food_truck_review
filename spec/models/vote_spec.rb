require 'spec_helper'

describe Vote do
  it { should belong_to :user}
  it { should belong_to :food_truck}

  describe "uniqueness" do
    it "can only have one vote per truck" do
      user = FactoryGirl.create(:user_with_food_trucks)

      first_vote = FactoryGirl.create(:vote, user: user, food_truck: user.food_trucks.first)
      second_vote = FactoryGirl.build(:vote, user: user, food_truck: user.food_trucks.first)
      expect(second_vote).to_not be_valid
    end
  end
end
