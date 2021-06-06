class ApplicationController < ActionController::Base
    def after_sign_in_path_for(current_user)
        if current_user.role == 1
            businesses_path
        else
            dashboard_user_path
        end
    end
end
