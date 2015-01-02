class Admin::BaseAdminController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :require_admin
  helper_method :current_user
  layout "admin"

  def index
    @businesses = Business.order(id: :asc)
  end

protected

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
      redirect_to root_path,  notice: "Unauthorized"
    end
  end
end