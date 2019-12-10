class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def check_logged_in
        return if user_signed_in?

        flash[:error] = "You must be logged in to access this page!"
        redirect_to new_user_registration_path
    end

    protected

    # allow username to be used in the sign_up and update forms
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
    end
end
