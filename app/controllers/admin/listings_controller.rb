class Admin::ListingsController < Admin::BaseAdminController
  # load_and_authorize_resource


  def update
    @listing = Listing.find(params[:id])
    if @listing.update_attributes(listing_params)
      respond_to do |format|
        format.json { render json: @listing.to_json }
        format.html { redirect_to admin_index_path}
      end
    else
      flash.now[:notice] = "The listing was not updated. Please try again."
      render :back
    end
  end


  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to admin_path, :alert => "The listing was deleted."
  end


  private

  def listing_params
    params.require(:listing).permit(:title, :description, :business_id, :wage, :hours, :number_of_postions, :end_date, :active)
  end
end