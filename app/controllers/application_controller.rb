class ApplicationController < ActionController::Base
	# before_action :authenticate_customer!, except: [:top, :about]
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
	def after_sign_up_for(resource)
		root_path
	end
	def after_sign_in_path_for(resource)
		if customer_signed_in?
			root_path
		elsif admin_signed_in?
			admins_index_path
		end
	end

	def after_sign_out_path_for(resource)
		if resource == :admin
			root_path
		elsif resource == :customer
			root_path
		end
	end
end

