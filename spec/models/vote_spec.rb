require 'spec_helper'

describe Vote do

  it { should     have_valid(:voted_up).when( true, false )}
  it { should_not have_valid(:voted_up).when(nil)}

  it { should belong_to(:voteable) }
  it { should belong_to(:user )}

  # pending 
  it 'can only have one vote per votable' do
    first_vote = FactoryGirl.create(:vote)
    second_vote = FactoryGirl.build(:vote, user: first_vote.user, food_truck: first_vote.food_truck)
    expect(second_vote).to_not be_valid
  end

end
