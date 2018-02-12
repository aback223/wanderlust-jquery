class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to :back
    end
  end

  private

  def user_params
    if params[:book].nil? || params[:book].empty?
      return false
    else
      params.require(:user).permit(:email, :password, :firstname, :lastname, :username)
    end
  end
end