class ListingsController < ApplicationController

  def index
    @listings = current_business.listings
  end

  def show
  end

  def new
    @listing = Listing.new
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
