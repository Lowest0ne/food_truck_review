class CreateFoodTruck < ActiveRecord::Migration
  def change
    create_table :food_trucks do |t|
      t.string :truck_name, null: false
      t.string :truck_color
      t.string :truck_size
      t.string :city, null: false
      t.string :picture, null: false
      t.text :description

      t.string :food_category, null: false
      t.date :time_of_appearance


    end
  end
end
