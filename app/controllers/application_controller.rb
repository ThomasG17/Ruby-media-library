class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_locale
  def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
  end


  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :types

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password) }
  end

  def types
    @types = Type.all
  end

  private

  def after_sign_up_path_for(resource_or_scope)
    new_cart_path
  end

end
