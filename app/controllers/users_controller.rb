class UsersController < ApplicationController
  def itinerary_index #users/:id/itineraries
    @user = User.find(params[:id])
    @itineraries = @user.itineraries
    redirect_to user_path(@user) #users/:id
  end

  def itinerary
    @user = User.find(params[:id])
    @itinerary = Itinerary.find(params[:itinerary_id])
    render template: 'itinerary/show'
  end
end