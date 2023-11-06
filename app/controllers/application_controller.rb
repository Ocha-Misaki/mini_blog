class ApplicationController < ActionController::Base
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_sign_in_params, only: [:create]

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name profile email password password_confirmation])
  end

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  end

end
