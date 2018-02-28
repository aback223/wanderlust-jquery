class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @upcoming_trips = Itinerary.most_recent_by_user(@user)
    respond_to do |format|
      format.html {render :show}
      format.json {render json: @user}
    end
  end
end