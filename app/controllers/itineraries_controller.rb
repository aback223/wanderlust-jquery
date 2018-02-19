class ItinerariesController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in?
      @itineraries = User.find(current_user.id).itineraries
    else
      @itineraries = Itinerary.all
    end
  end

  def new
    @itinerary = Itinerary.new
    @itinerary.images.build(image_num: '0')
    @itinerary.images.build(image_num: '1')
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      user = User.find(params[:user_id])
      user.itineraries.push(@itinerary)
      redirect_to user_path(current_user)
    else
      redirect_to new_user_itinerary_path
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @days = @itinerary.days
    render :show
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
    render 'users/show'
  end

  private 

  def itinerary_params
    params.require(:itinerary).permit(:trip_title, :dateend, :datestart, 
      images_attributes: [
        :url, 
        :caption, 
        :image_num
     ]
   )
  end
end