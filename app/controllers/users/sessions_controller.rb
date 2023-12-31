class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params

  protected

  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
