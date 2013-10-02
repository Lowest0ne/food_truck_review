require 'spec_helper'

describe Review do
  it { should belong_to :user }
  it { should belong_to :food_truck }

  it { should have_valid(:user_id).when(4, 54) }
  it { should_not have_valid(:user_id).when(nil, 1.0, -34) }

  it { should have_valid(:food_truck_id).when(4, 54) }
  it { should_not have_valid(:food_truck_id).when(nil, 1.0, -34) }

  it { should have_valid(:body).when('filler stuff') }
  it { should_not have_valid(:body).when(nil, '') }
end
