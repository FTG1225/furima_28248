class ApplicationController < ActionController::Base
  before_action :basic_auth

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sur_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:sur_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:given_name_kana])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:date_of_birth])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end
end
