class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show]
  before_action :require_business_admin, only: [:update_business_owner]
  # before_action :require_admin, only: [:index]
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def show
    if current_user.business_id?
      @business = Business.find(current_user.business_id)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:email] = @user.id
      flash[:notice] = "User created"
      redirect_to root_path
    else
      flash[:notice] = "User could not be created"
      @errors = @user.errors.map do |attribute, msg|
        "#{attribute.to_s.gsub("_", " ").capitalize}: #{msg.downcase}"
      end.uniq
      render :new
    end
  end


  def update_business_owner
    user = User.find_by email: params[:user][:email]
    user.update(business_id: current_business.id)
    if user.save
      flash[:notice] = "Co-Owner has been added to your business"
      redirect_to admin_url(subdomain: current_business.slug)
    else
      flash[:alert] = "Error, Co-Owner was not added to your business"
      redirect_to admin_url(subdomain: current_business.slug)
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :full_name, :user_name, :password, :password_confirmation, :picture, :resume)
  end
end
