class ItineraryController < ApplicationController
  def new
    @itinerary = Itinerary.new
  end

  

  private 

  def itinerary_params
    params.require(:itinerary).permit(:trip_title, :dateend, :datestart)
  end
end