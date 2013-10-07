require 'spec_helper'

describe Vote do

  it { should     have_valid(:voted_up).when( true, false )}
  it { should_not have_valid(:voted_up).when(nil)}

  it { should belong_to(:voteable) }
  it { should belong_to(:user )}

  # pending 
  it 'can only have one vote per votable' do
    user = FactoryGirl.create(:user_with_reviews)
    review = user.reviews.first

    vote = FactoryGirl.create( :vote, voteable: review, user: user )

    vote = FactoryGirl.build( :vote, voteable: review, user: user )
    vote.should_not be_valid

    food_truck = FoodTruck.first

    vote = FactoryGirl.build( :vote, voteable: food_truck, user: user )
    vote.should be_valid
    vote.save

    vote = FactoryGirl.build( :vote, voteable: food_truck, user: user )
    vote.should_not be_valid
  end

end
