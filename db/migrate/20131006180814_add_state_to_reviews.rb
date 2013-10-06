class AddStateToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :state, :string, null: false, default: "complete"
  end
end
