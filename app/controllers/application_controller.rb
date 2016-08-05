class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    user_session_path # サインアウト後のリダイレクト先URL
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:nickname, :work, :profile, :avatar]

    devise_parameter_sanitizer.for(:account_update) << [:nickname, :work, :profile, :avatar]
  end

end
