class ItineraryController < ApplicationController
  before_action :authenticate_user!

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      render template: 'users/show'
    else
      redirect_to new_itinerary_path
    end
  end

  private 

  def itinerary_params
    params.require(:itinerary).permit(:trip_title, :dateend, :datestart)
  end
end