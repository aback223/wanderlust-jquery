class ItineraryController < ApplicationController
  def index 
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  private 

  def itinerary_params
    params.require(:itinerary).permit(:trip_title, :dateend, :datestart)
  end
end