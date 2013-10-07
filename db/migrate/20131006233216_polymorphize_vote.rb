class PolymorphizeVote < ActiveRecord::Migration
  def up
    remove_column :votes, :food_truck_id
    add_column :votes, :voteable_id, :integer, null: false, default: 0
    add_column :votes, :voteable_type, :string, null: false, default: 'FoodTruck'
  end

  def down
    remove_column :votes, :voteable_id
    remove_column :votes, :voteable_type
    add_column :votes, :food_truck_id, :integer, null: false, default: 0
  end
end
