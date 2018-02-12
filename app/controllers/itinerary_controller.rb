class ItineraryController < ApplicationController
  def new
    @itinerary = Itinerary.new
  end
end