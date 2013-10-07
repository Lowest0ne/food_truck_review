class VotesController < ApplicationController
  def new
    @vote = Vote.new

    if params[:food_truck_id]
      @findable = FoodTruck.find(params[:food_truck_id])
    elsif params[:review_id]
      @findable = Review.find(params[:review_id])
    end

  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id

    if params[:food_truck_id]
      @vote.voteable_type = 'FoodTruck'
      @vote.voteable_id = params[:food_truck_id]
    elsif params[:review_id]
      @vote.voteable_type = 'Review'
      @vote.votebale_id = params[:review_id]
    end

    if @vote.save
      flash[:notice] = "You voted successfully"

      if params[:food_truck_id]
        redirect_to food_trucks_path
      elsif params[:review_id]
        review = Review.find( params[:review_id] )

        redirect_to food_truck_reviews( review.food_truck )
      end
    
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
