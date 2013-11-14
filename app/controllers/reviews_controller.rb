class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @food_truck = FoodTruck.find(params[:food_truck_id])
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @food_truck = FoodTruck.find(params[:food_truck_id])
    @review.food_truck_id = @food_truck.id

    if @review.save
      Vote.create( voted_up: @review.voted_up, user: current_user, voteable: @food_truck)

      flash[:notice] = 'Review is created successfully'
      redirect_to food_truck_reviews_path(@food_truck)
    else
      render :new
    end
  end

  def index
    if params[:food_truck_id]
      @food_truck = FoodTruck.find( params[:food_truck_id] )
      @reviews = Review.where( food_truck_id: @food_truck.id )
    else
      @food_truck = nil
      @reviews = Review.all
    end
  end

  protected
  def review_params
    params.require(:review).permit(
      :body,
      :voted_up
      )
  end

end
