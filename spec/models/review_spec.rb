require 'spec_helper'

describe Review do
  it { should validate_presence_of(:user)       }
  it { should validate_presence_of(:food_truck) }

  it { should belong_to(:user) }
  it { should belong_to(:food_truck) }

  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:state) }

  it { should have_many(:votes)}

  describe "States" do
    before :each do
      user = FactoryGirl.create(:user_with_reviews)
      @review = user.reviews.first
    end


    it "has a first state of pending" do
      expect(@review.state).to eql("pending")
    end

    it "moves from pending to completed" do
      @review.complete
      @review.should be_completed
    end

    it "moves from completed to flagged" do
      @review.complete
      @review.flag
      @review.should be_flagged
    end

    it "does not move from pending to flagged" do
       @review.flag.should be_false
    end

  end


end
