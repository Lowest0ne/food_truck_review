class Vote < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :food_truck

  belongs_to :food_truck, inverse_of: :votes
  belongs_to :user, inverse_of: :votes
end
