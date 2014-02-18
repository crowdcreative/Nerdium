class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

 	# Devise com fields customizados
	def configure_permitted_parameters
	 	devise_parameter_sanitizer.for(:sign_up) do |u|
			u.permit(:first_name, :last_name, :profile_name, :email, :password, :password_confirmation, :avatar, :bio)
		end
		devise_parameter_sanitizer.for(:account_update) do |u|
			u.permit(:first_name, :last_name, :profile_name, :password, :password_confirmation, :current_password, :avatar, :bio)
		end
	end

	# authenticate is admin for Devise
	def authenticate_admin
		if user_signed_in?
	    unless current_user.admin 
	      redirect_to home_path
	      false
	    else
	      true
	    end
	  else
	  	redirect_to entrar_path
	  	false
	  end
  end


end
