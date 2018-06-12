module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:company_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:hires_per_year])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:city])
    devise_parameter_sanitizer.permit(:account_update, keys: [:postal_code])
    devise_parameter_sanitizer.permit(:account_update, keys: [:payment_info])
  end
end
