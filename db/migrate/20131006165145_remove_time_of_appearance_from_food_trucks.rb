class RemoveTimeOfAppearanceFromFoodTrucks < ActiveRecord::Migration
  def change
    remove_column :food_trucks, :time_of_appearance, :Date
  end
end
