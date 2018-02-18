class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @recent_trips = Itinerary.by_user(current_user) && Itinerary.most_recent
  end
end