class FoodTrucksController < ApplicationController
  def new
    @food_truck = FoodTruck.new
  end

  def create
    @food_truck = FoodTruck.new(food_truck_params)
    if @food_truck.save
      flash[:notice] = "You made a food truck"
      redirect_to @food_truck
    else
      flash[:notice] = "You failed to make a food truck"
      render new_food_truck_path
    end
  end

  def show
    @food_truck = FoodTruck.find(params[:id])
  end

  private

  def food_truck_params
    params.require(:food_truck).permit(:name, :city, :picture, :description, :food_category)
  end
end
