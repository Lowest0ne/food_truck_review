class Vote < ActiveRecord::Base
  validates :food_truck_id, uniqueness: {scope: :user_id}

  validates_numericality_of :user_id,
    allow_blank: false, 
    only_integer: true
  validates_numericality_of :food_truck_id,
    allow_blank: false, 
    only_integer: true
  
  belongs_to :food_truck,
    inverse_of: :votes

  belongs_to :user,
    inverse_of: :votes
end
