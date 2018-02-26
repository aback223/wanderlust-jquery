class ActivitiesController < ApplicationController
   def new
    @day = Day.find(params[:day_id])
    @activity = @day.activities.build
  end
end