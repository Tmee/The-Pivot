class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def show
    @listings = current_business.listings.all
  end

  def new
    @listing     = Listing.new
    @business_id = current_business.id

  end

  def create
    @listing = Listing.new(listing_params)

    if @listing.save
      session[:email] = @listing.id
      flash[:notice] = "Listing created"
      redirect_to root_path
    else
      flash[:notice] = "Listing could not be created"
      @errors = @user.errors.map do |attribute, msg|
        "#{attribute.to_s.gsub("_", " ").capitalize}: #{msg.downcase}"
      end.uniq
      render :new
    end
  end


  private

  def listing_params
    params.require(:listing).permit(:title, :description, :business_id, :wage, :hours, :number_of_postions, :end_date)
  end
end
