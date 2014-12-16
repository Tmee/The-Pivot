class BusinessesController < ApplicationController
  before_action :current_business, only: [:show]
  # before_action :require_admin, only: [:index]

  def index
    @business = Business.all
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(user_params)

    if @business.save
      session[:email] = @business.id
      flash[:notice] = "Business created"
      redirect_to root_path
    else
      flash[:notice] = "Business could not be created"
      @errors = @user.errors.map do |attribute, msg|
        "#{attribute.to_s.gsub("_", " ").capitalize}: #{msg.downcase}"
      end.uniq
      render :new
    end
  end


private

  def user_params
    params.require(:user).permit(:name, :adress, :user_name, :password, :password_confirmation)
  end
end
