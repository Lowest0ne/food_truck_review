class RemoveCategoryFromFoodTrucks < ActiveRecord::Migration
  def change
    remove_column :food_trucks, :food_category, :string
  end
end
