class BusinessesController < ApplicationController
  # before_action :require_admin, only: [:index]

  def index
    @business = Business.all
  end
  
  def show
    @business = Business.find_by slug: request.subdomain

    # business_name  = Business.find_by slug: request.subdomain
    # business_id    = business_name.id
    # @business      = Business.find(business_id)
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)

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

  def business_params
    params.require(:business).permit(:name, :address, :state, :phone, :email, :slug, :url, :description)
  end
end
