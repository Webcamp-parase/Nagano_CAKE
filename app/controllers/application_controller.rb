class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
      case resource
      when Admin
         admins_home_top_path
      when Customer
         root_path
      else
         super
      end
    end

  def after_sign_out_path_for(resource)
      case resource
      when Admin, :admin, :admins
        new_admin_session_path
      when Customer, :customer, :customers
        root_path
      else
        super
      end
    end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :read_last_name, :read_first_name, :postal_code, :address, :phone_number])
	end


end
