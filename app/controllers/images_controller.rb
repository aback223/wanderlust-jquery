class ImagesController < ApplicationController
  def new 
    @itinerary = Itinerary.find(params[:itinerary_id])
    @image = @itinerary.images.build
  end
end