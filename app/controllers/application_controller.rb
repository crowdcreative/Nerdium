class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

 	# my custom fields are :first_name, :last_name, :profile_name
	def configure_permitted_parameters
	 	devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:first_name, :last_name, :profile_name, :password, :password_confirmation, :current_password)
		end
	end
end
