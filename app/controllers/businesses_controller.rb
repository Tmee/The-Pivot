class BusinessesController < ApplicationController
  before_action :current_business, only: [:show, :admin, :update]
  # before_action :require_business_admin, only: [:admin]
  load_and_authorize_resource


  def index
    @business = Business.where :active => true
  end

  def show
    if current_business && current_business.active?
      @listings = Listing.select { |listing| listing.business_id == current_business.id }
    else
      redirect_to root_url subdomain: "www"
    end
  end

  def admin
  end

  def new
    @business ||= Business.new
  end

  def create
    @business = Business.new(business_params)
    @current_business = @business
    if @business.save
      current_user.update_attribute(:business_id, @business.id)
      # raise " :::::  #{@current_user}  ::::::"
      flash[:notice] = "Business created"
      redirect_to root_url subdomain: @business.slug
    else
      flash[:notice] = "Business could not be created"
      @errors = @user.errors.map do |attribute, msg|
        "#{attribute.to_s.gsub("_", " ").capitalize}: #{msg.downcase}"
      end.uniq
      render :new
    end
  end

  def update
    @business = Business.find(params[:id])
    @business.update(business_params)
    redirect_to business_path(@business)
  end


private

  def business_params
    params.require(:business).permit(:name, :address, :state, :phone, :email, :slug, :url, :description)
  end
end
