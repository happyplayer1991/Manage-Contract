class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist

  def after_sign_in_path_for(resource)
  	root_path
	end
end
