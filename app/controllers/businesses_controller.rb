  class BusinessesController < ApplicationController
  before_action :current_business, only: [:show]
  # before_action :require_admin, only: [:index]
  # load_and_authorize_resource

  def index
    @business = Business.all
  end

  def show
    @listings = Listing.select { |listing| listing.business_id == current_business.id }
  end

  def admin
    authorize! :manage, current_business
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
      redirect_to home_url subdomain: @business.slug
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
