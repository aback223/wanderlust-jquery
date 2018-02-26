class ActivitiesController < ApplicationController
   def new
    @day = Day.find(params[:day_id])
    @activity = @day.activities.build
  end

  def create
    day = Day.find(params[:day_id])
    activity = day.activities.create(activity_params)
    if activity.save
      redirect_to itinerary_path(day.itinerary)
    else
      render :new
    end
  end
end