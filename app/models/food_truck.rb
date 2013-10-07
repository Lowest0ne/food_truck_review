class FoodTruck < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :photo
  validates_presence_of :user

  has_many   :reviews, inverse_of: :food_truck, dependent: :destroy
  has_many   :votes,   as: :voteable, inverse_of: :voteable, dependent: :destroy
  belongs_to :user,    inverse_of: :food_trucks

  mount_uploader :photo, PhotoUploader

  accepts_nested_attributes_for :votes
end
