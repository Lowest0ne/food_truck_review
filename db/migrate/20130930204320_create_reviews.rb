class CreateReviews < ActiveRecord::Migration
  def change
      create_table :reviews do |t|
      t.text :body, null: false
      t.integer :user_id, null: false
      t.integer :food_truck_id, null: false
      t.boolean :is_good, null: false

      t.timestamps
    end
  end
end
