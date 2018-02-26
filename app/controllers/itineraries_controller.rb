class ItinerariesController < ApplicationController
  before_action :authenticate_user!

  def index
    @itineraries = Itinerary.all
    respond_to do |format|
      format.html {render :index}
      format.json {render json: @itineraries}
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
      @errors = @itinerary.errors
      render :new
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
    @days = @itinerary.days
    render :show
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    if @itinerary.update_attributes(itinerary_params)
      redirect_to user_path(current_user)
    else
      render 'itineraries/edit'
    end
  end

  def destroy 
    Itinerary.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end

  private 

  def itinerary_params
    params.require(:itinerary).permit(:trip_title, :dateend, :datestart, 
      images_attributes: [:id, :url, :caption, :image_num])
  end
end