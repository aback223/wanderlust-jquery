class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @recent_trips = Itinerary.most_recent_by_user(current_user)
  end
end