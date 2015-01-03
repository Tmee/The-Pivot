class ListingsController < ApplicationController
  load_and_authorize_resource

  def index
    @listings = Listing.where :active => true
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def update
    binding.pry
    if @listing.update_attributes(listing_params)
      respond_to do |format|
        format.json { render json: @listing.to_json }
        format.html { redirect_to listing_path}
      end
    else
      flash.now[:notice] = "The business was not updated. Please try again."
      render :back
    end
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
    params.require(:listing).permit(:title, :description, :business_id, :wage, :hours, :number_of_postions, :end_date, :active)
  end
end
