class ImagesController < ApplicationController
  def new 
    @itinerary = Itinerary.find(params[:itinerary_id])
    @image = @itinerary.images.build
  end

  def create
    itinerary = Itinerary.find(params[:itinerary_id])
    @image = itinerary.images.create(url: params[:image][:url])
    if @image.save
      redirect_to itinerary_path(itinerary)
    else
      render :new
    end
  end
end