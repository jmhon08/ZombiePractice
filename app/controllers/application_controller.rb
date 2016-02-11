class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_filter :get_welcome_text


  def get_welcome_text
    @welcome_text = (current_zombie && current_zombie.name) ? "Hi " + current_zombie.name : "Welcome!!"
  end
 	

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        << :name
  end
end
