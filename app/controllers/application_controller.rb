class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :authenticate_user!
  include DeviseWhitelist
  def after_sign_in_path_for(resource)
  jobs_path
	end
end
