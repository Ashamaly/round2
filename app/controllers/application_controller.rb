class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    # allow username to be used in the sign_up and update forms
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:username, :name])
    end
end
