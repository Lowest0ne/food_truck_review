class ChangeNameOfFoodTruckPicture < ActiveRecord::Migration
  def up
    remove_column :food_trucks, :picture
    add_column :food_trucks, :photo, :string
  end

  def down
    add_column :food_trucks, :picture, :string
    remove_column :food_trucks, :photo
  end
end
