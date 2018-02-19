class DaysController < ApplicationController
  def new
    @day = Day.new
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = @itinerary.days.create(days_params)
    if @day.save
      redirect_to itinerary_path(params[:itinerary_id])
    else
      redirect_to new_itinerary_day_path
    end
  end

  def edit
    @day = Day.find(params[:id])
    @itinerary = @day.itinerary
  end

  def update
    @day = Day.find(params[:id])
    @day.update(days_params)
    redirect_to itinerary_path(@day.itinerary)
  end

  private

  def days_params
    params.require(:day).permit(:title, :date)
  end
end