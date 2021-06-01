class DashboardUserController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @businesses = Business.all
  end


  def userProfile
    @user = User.find(current_user.id)
    render json: @user
  end


end
