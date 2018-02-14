class UsersController < ApplicationController
  before_action :authenticate_user!

  # def itinerary_index #users/:id/itineraries
  #   @user = User.find(params[:id])
  #   @itineraries = @user.itineraries
  #   redirect_to user_path(@user) #users/:id
  # end

  # def itinerary
  #   @user = User.find(params[:id])
  #   render template: 'itinerary/show'
  # end
  def show
    @user = User.find(params[:id])
  end
end