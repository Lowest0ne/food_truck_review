class FoodTruck < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :photo

  has_many :reviews,
    inverse_of: :food_truck,
    dependent: :destroy

  has_many :votes,
    inverse_of: :food_truck,
    dependent: :destroy

  mount_uploader :photo, PhotoUploader
end
