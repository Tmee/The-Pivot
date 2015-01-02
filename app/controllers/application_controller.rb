class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  protect_from_forgery with: :null_session

  helper_method :current_user, :require_admin
  helper_method :current_business, :require_admin
  helper_method :business_owner
  helper_method :cart

  before_action :modal_new_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_business
    @current_business ||= Business.find_by_slug request.subdomain
  end

  def business_owner
    if @current_user.business_id == @current_business.id
      @business_owner = @current_user
    end
  end

  def require_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, alert: "Not Authorized"
    end
  end

  def require_business_admin
    unless current_user && @current_user.business_id == @current_business.id?
      redirect_to root_path, alert: "Not Authorized"
    end
  end

  def modal_new_user
    @user = User.new
  end

  def cart
    session[:cart] ||= {}
  end
end
