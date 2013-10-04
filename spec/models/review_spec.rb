require 'spec_helper'

describe Review do
  it { should belong_to :user }
  it { should belong_to :food_truck }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:food_truck) }

  it { should have_valid(:body).when('filler stuff') }
  it { should_not have_valid(:body).when(nil, '') }
end
