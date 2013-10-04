require 'spec_helper'

describe Vote do
  it { should belong_to :user}
  it { should belong_to :food_truck}

  describe "uniqueness" do
    it "can only have one vote per truck" do
      
      first_vote = FactoryGirl.create(:vote)
      second_vote = FactoryGirl.build(:vote, user: first_vote.user, 
        food_truck: first_vote.food_truck)
      expect(second_vote).to_not be_valid
    end
  end
end
