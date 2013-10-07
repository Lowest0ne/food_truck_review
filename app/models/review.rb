class Review < ActiveRecord::Base

  attr_accessor :voted_up

  validates_presence_of :state
  validates_presence_of :food_truck
  validates_presence_of :user
  validates_presence_of :body

  has_many :votes, as: :voteable, inverse_of: :voteable

  belongs_to :user,       inverse_of: :reviews
  belongs_to :food_truck, inverse_of: :reviews

  state_machine :state, initial: :pending do
    state :pending
    state :completed
    state :flagged

    event :complete do
      transition pending: :completed
    end

    event :flag do
      transition completed: :flagged
    end
  end

  accepts_nested_attributes_for :votes

  def verdict
    vote = Vote.find_by( voteable_id: self.food_truck.id, voteable_type: 'FoodTruck' )
    vote.voted_up == true ? 'I like' : 'I do not like'
  end
end
