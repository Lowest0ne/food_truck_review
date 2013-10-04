class AddUniqueIndexToVotes < ActiveRecord::Migration
  def change
    add_index :votes, [:user_id, :food_truck_id], unique: true
  end
end
