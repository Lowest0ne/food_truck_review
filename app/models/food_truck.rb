class FoodTruck < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :city
  validates_presence_of :picture
  validates_presence_of :food_category

  has_many :reviews,
    inverse_of: :food_truck,
    dependent: :destroy

  has_many :votes,
    inverse_of: :food_truck,
    dependent: :destroy

end
