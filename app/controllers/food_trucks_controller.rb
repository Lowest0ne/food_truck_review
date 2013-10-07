class FoodTrucksController < ApplicationController
  def new
    @food_truck = FoodTruck.new
  end

  def create
    @food_truck = FoodTruck.new(food_truck_params)
    @food_truck.user_id = current_user.id
    if @food_truck.save
      flash[:notice] = "You made a food truck"
      redirect_to food_truck_reviews_path(@food_truck)
    else
      flash[:notice] = "You failed to make a food truck"
      render :new
    end
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
  end

  def index
    @food_trucks = FoodTruck.order("name").page(params[:page]).per(5)
  end

  private

  def food_truck_params
    params.require(:food_truck).permit(:name, :photo, :description)
  end
end
