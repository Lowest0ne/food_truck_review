class Vote < ActiveRecord::Base

  validates_presence_of :voteable
  validates_presence_of :user
  validates_inclusion_of :voted_up, in: [ true, false]

  belongs_to :voteable, polymorphic: true, inverse_of: :votes
  belongs_to :user, inverse_of: :votes
end
