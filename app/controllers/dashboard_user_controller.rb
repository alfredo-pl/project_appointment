class DashboardUserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ update_profile ]

  def index
    @businesses = Business.all
    @swicht = true
  end


  def user_profile
    @user = User.find(current_user.id)
    render json: @user
  end

  def update_profile
    respond_to do |format|
      if @user.update_user_profile(user_params)
        format.js
      else
        format.js
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params["user"]["id"].to_i)
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :run, :direction, :phone)
    end

end
