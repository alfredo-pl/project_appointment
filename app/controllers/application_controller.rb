class ApplicationController < ActionController::Base
    def after_sign_in_path_for(current_user)
        if current_user.role == 1
            dashboard_business_path
        else
            dashboard_user_path
        end
    end

    def authenticate_admin!
        unless current_user.present? && current_user.role == 1
          flash[:alert] = "You are not authorized to enter that section"
          redirect_to dashboard_user_path
        end
      end
end
