class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @truck = FoodTruck.find(params[:food_truck_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @truck = FoodTruck.find(params[:food_truck_id])
    @review.food_truck_id = @truck.id

    if @review.save
      flash[:notice] = 'Review is created successfully'
      redirect_to new_food_truck_review_path(@truck)
    else
      render :new
    end
  end

  protected
  def review_params
    params.require(:review).permit(
      :body,
      :is_good
      )
  end

end
