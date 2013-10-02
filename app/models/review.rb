class Review < ActiveRecord::Base

  validates_numericality_of :user_id,
    only_integer: :true,
    greater_than_or_equal_to: 1

  validates_numericality_of :food_truck_id,
    only_integer: :true,
    greater_than_or_equal_to: 1

  validates_presence_of :body

  validates_presence_of :is_good?

  belongs_to :user,
    inverse_of: :reviews

  belongs_to :food_truck,
    inverse_of: :reviews
end
