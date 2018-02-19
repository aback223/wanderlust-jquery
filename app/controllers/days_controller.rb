class DaysController < ApplicationController
  def new
    @day = Day.new
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @day = @itinerary.days.create(title: params[:day][:title])
    if @day.save
      redirect_to itinerary_path(params[:itinerary_id])
    else
      redirect_to new_itinerary_day_path
    end
  end
end