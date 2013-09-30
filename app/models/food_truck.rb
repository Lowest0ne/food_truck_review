class FoodTruck < ActiveRecord::Base
  validates_presence_of :truck_name
  validates_presence_of :city
  validates_presence_of :picture
  validates_presence_of :food_category

end