class RemoveColumnsFromTrucks < ActiveRecord::Migration
  def up
    remove_column :food_trucks, :truck_color
    remove_column :food_trucks, :truck_size
    remove_column :food_trucks, :truck_name
    add_column :food_trucks, :name, :string
  end

  def down
    add_column :food_trucks, :truck_color, :string
    add_column :food_trucks, :truck_size, :string
    add_column :food_trucks, :truck_name, :string

    remove_column :food_trucks, :name
  end
end
