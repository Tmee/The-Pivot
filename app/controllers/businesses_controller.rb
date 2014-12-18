  class BusinessesController < ApplicationController
  # before_action :current_business, only: [:show]
  # before_action :require_admin, only: [:index]

  def index
    @business = Business.all
  end

  def show
    @business = current_business
  end

  def home
    @business = current_business
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

    if @business.save
      session[:email] = @business.id
      flash[:notice] = "Business created"
      redirect_to home_path subdomain: @business.slug
      # binding.pry
    else
      flash[:notice] = "Business could not be created"
      @errors = @user.errors.map do |attribute, msg|
        "#{attribute.to_s.gsub("_", " ").capitalize}: #{msg.downcase}"
      end.uniq
      render :new
    end
  end


private

  def business_params
    params.require(:business).permit(:name, :address, :state, :phone, :email, :slug, :url, :description)
  end
end
