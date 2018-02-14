class UsersController < ApplicationController
  before_action :authenticate_user!

  def itinerary_index #users/:id/itineraries
    @user = User.find(params[:id])
    @itineraries = @user.itineraries
    redirect_to user_path(@user) #users/:id
  end

  def itinerary
    @user = User.find(params[:user_id]
    @itinerary = Itinerary.find(params[:id])
    render template: 'users/show'
  end
end