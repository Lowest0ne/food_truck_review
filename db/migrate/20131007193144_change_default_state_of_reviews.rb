class ChangeDefaultStateOfReviews < ActiveRecord::Migration
  def up
    remove_column :reviews, :state
    add_column :reviews, :state, :string, null: false, default: 'pending'
  end

  def down
    remove_column :reviews, :state
    add_column :reviews, :state, :string, null: false, default: 'complete'
  end

end
