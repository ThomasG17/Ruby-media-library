class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :types

  def index
  end

  def after_sign_in_path_for(resource)
    if session[:cart_id].nil?
      @cart = Cart.find_by(user_id: current_user.id)
      session[:cart_id] = @cart.id
    end
    if session[:user_id].nil?
      session[:user_id] = current_user.id
    end
    root_path
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:firstname, :lastname, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:firstname, :lastname, :email, :password, :current_password) }
  end

  def types
    @types = Type.all
  end

end
