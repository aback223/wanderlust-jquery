class ImagesController < ApplicationController
  def new 
    @itinerary = Itinerary.find(params[:itinerary_id])
    @image = @itinerary.images.build
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @image = @itinerary.images.create(url: params[:image][:url])
    if @image.save
      render json: @image, status: 201
    else
      @errors = @image.errors
      render :new
    end
  end

  def destroy
    image = Image.find(params[:id])
    user = image.itinerary.users[0]
    if user == current_user
      image.destroy
      redirect_to itinerary_path(image.itinerary)
    else
      redirect_to itinerary_path(image.itinerary)
    end
  end
end