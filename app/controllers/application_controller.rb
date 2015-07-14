class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  protect_from_forgery with: :exception

  responders :flash

  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_url, notice: 'Access denied!'
  end

  def after_sign_in_path_for(_resource)
    admin_root_path
  end

  respond_to :html, :json

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
