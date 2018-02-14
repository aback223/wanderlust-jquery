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
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    if @itinerary.save
      user = User.find(params[:itinerary][:user_id])
      user.itineraries.push(@itinerary)
      render template: 'users/show'
    else
      redirect_to new_user_itinerary_path
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  private 

  def itinerary_params
    params.require(:itinerary).permit(:trip_title, :dateend, :datestart)
  end
end