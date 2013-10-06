class RemoveCityFromFoodTrucks < ActiveRecord::Migration
  def change
    remove_column :food_trucks, :city, :string
  end
end
