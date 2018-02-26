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

  def show
    @activity = Activity.find(params[:id])
  end
  
  private 

  def activity_params
    params.require(:activity).permit(:title, :activity_type, :address, :url, :notes)
  end
end