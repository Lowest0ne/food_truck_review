require 'spec_helper'

describe FoodTruck do

  it {should validate_presence_of(:name) }
  it {should validate_presence_of(:photo) }

end
