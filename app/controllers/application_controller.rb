class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def authenticate_admin!
        redirect_to root_path unless current_user.admin?
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name] )
      devise_parameter_sanitizer.permit(:sign_up, keys: [:zip] )
      devise_parameter_sanitizer.permit(:sign_up, keys: [:address] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:name] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:zip] )
      devise_parameter_sanitizer.permit(:account_update, keys: [:address] )
    end
end
