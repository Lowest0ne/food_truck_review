class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id, null: false
      t.integer :food_truck_id, null: false
      t.boolean :voted_up, null: false

      t.timestamps
    end
  end
end
