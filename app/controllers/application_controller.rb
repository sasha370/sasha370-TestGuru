class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  def after_sign_in_path_for(user)
    flash[:notice] = I18n.t('.hello', user: user.first_name)
    user.admin? ? admin_tests_path : root_path
  end

  protected

  def set_locale
    I18n.locale_available?(params[:lang]) ? I18n.locale = params[:lang] : I18n.default_locale
  end

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
