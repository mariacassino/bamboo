class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

protect_from_forgery with: :exception
before_action :authenticate_user!, except: [:index, :show, :random]

include Pundit
# after_action :verify_authorized, unless: :devise_controller

  rescue_from Pundit::NotAuthorizedError do |e|
      flash[:danger] = "NO!"
     redirect_to new_user_session_path
  end

end
