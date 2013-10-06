require 'spec_helper'

describe FoodTruck do

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:photo) }
  it { should validate_presence_of(:user) }

  it { should belong_to :user }
end
