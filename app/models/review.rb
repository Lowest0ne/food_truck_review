class Review < ActiveRecord::Base
  validates_presence_of :state
  validates_presence_of :food_truck
  validates_presence_of :user
  validates_presence_of :body
  validates_inclusion_of :is_good, in: [ true, false ],
    message: "must be filled"

  belongs_to :user,
    inverse_of: :reviews

  belongs_to :food_truck,
    inverse_of: :reviews

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
end
