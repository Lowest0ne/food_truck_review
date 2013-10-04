class VotesController < ApplicationController
  def new
    @vote = Vote.new
    @truck = FoodTruck.find(params[:food_truck_id])
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    @truck = FoodTruck.find(params[:food_truck_id])
    @vote.food_truck_id = @truck.id

    if @vote.save
      flash[:notice] = "You voted successfully"
      redirect_to new_food_truck_vote_path(@truck)
    else
      render :new
    end
  end

  protected
  def vote_params
    params.require(:vote).permit(
      :voted_up
      )
  end
end
