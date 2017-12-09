class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_params

  ADDITIONAL_PARAMS = %i[first_name last_name].freeze

  protected

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: ADDITIONAL_PARAMS)
    devise_parameter_sanitizer.permit(:account_update, keys: ADDITIONAL_PARAMS)
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
