class RemoveIsGoodFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :is_good, :boolean
  end
end
