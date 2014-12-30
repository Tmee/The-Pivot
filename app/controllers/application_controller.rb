class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :null_session

  helper_method :current_user, :require_admin
  helper_method :current_business

  before_action :modal_new_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_business
    business = Business.find_by_slug request.subdomain
  end

  def require_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, notice: "NO SOUP FOR YOU!"
    end
  end

  def modal_new_user
    @user = User.new
  end
end
