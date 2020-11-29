class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(user)
    flash[:notice] = "Hello, #{user.first_name}!"
    user.admin? ? admin_tests_path : root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(
          :name,
          :email,
          :password,
          :password_confirmation,
          :first_name,
          :last_name)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(
          :name,
          :email,
          :password,
          :password_confirmation,
          :first_name,
          :last_name)
    end
  end

end
