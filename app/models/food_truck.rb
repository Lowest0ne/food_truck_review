class FoodTruck < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :photo
  validates_presence_of :user

  has_many :reviews,
    inverse_of: :food_truck,
    dependent: :destroy

  has_many :votes,
    inverse_of: :food_truck,
    dependent: :destroy

  belongs_to :user,
    inverse_of: :food_trucks

  mount_uploader :photo, PhotoUploader
end
