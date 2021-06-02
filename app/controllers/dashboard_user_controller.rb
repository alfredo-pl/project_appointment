class DashboardUserController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @businesses = Business.all
    @swicht = true
  end


  def userProfile
    @user = User.find(current_user.id)
    render json: @user
  end

  def updateProfile
   @user = User.find(params["user"]["id"].to_i)
   @user.name =params["user"]["name"]
   @user.run =params["user"]["run"]
   @user.direction =params["user"]["direction"]
   @user.phone =params["user"]["phone"]
   @user.save
   redirect_to dashboard_user_path
  end

end
