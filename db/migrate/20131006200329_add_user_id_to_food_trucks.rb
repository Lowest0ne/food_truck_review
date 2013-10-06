class AddUserIdToFoodTrucks < ActiveRecord::Migration
  def change
    add_column :food_trucks, :user_id, :integer, null: false, default: 1
  end
end
