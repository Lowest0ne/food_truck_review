require 'spec_helper'

describe User do

  it { should validate_presence_of(:user_name  ) }
  it { should validate_presence_of(:first_name ) }
  it { should validate_presence_of(:last_name  ) }

  it { should have_many(:food_trucks ) }
  it { should have_many(:reviews     ) }
  it { should have_many(:votes       ) }
  
end
